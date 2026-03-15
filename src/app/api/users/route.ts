import { NextResponse } from "next/server";
import bcrypt from "bcryptjs";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function GET() {
  try { await requireAuth(["admin"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const supabase = await createClient();
  const { data: users } = await supabase.from("users").select("username, name, lastname, age");
  const { data: roles } = await supabase.from("user_role_assignments").select("username, role_type");

  const mapped = users?.map((u) => ({
    ...u,
    roles: roles?.filter((r) => r.username === u.username).map((r) => r.role_type).join(", ") || "",
  }));
  return NextResponse.json(mapped ?? []);
}

export async function PUT(request: Request) {
  try { await requireAuth(["admin"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const { username, password, name, lastname, age, roles } = body;
  const supabase = await createClient();

  const updates: Record<string, unknown> = { name, lastname, age: age || null };
  if (password) {
    updates.password = await bcrypt.hash(password, 10);
  }

  await supabase.from("users").update(updates).eq("username", username);

  // Update roles
  if (roles) {
    await supabase.from("user_role_assignments").delete().eq("username", username);
    const roleInserts = roles.map((r: string) => ({ username, role_type: r }));
    if (roleInserts.length > 0) {
      await supabase.from("user_role_assignments").insert(roleInserts);
    }
  }

  return NextResponse.json({ success: true });
}
