import { NextResponse } from "next/server";
import bcrypt from "bcryptjs";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function POST(request: Request) {
  try {
    await requireAuth(["admin"]);
  } catch {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  const { username, password, name, lastname, age, roles } = await request.json();

  if (!username || !password || !name || !lastname) {
    return NextResponse.json({ error: "Missing required fields" }, { status: 400 });
  }

  const supabase = await createClient();

  // Check if user exists
  const { data: existing } = await supabase
    .from("users")
    .select("username")
    .eq("username", username)
    .single();

  if (existing) {
    return NextResponse.json({ error: "Username already exists" }, { status: 409 });
  }

  const hashedPassword = await bcrypt.hash(password, 10);

  const { error: userError } = await supabase
    .from("users")
    .insert({ username, password: hashedPassword, name, lastname, age: age || null });

  if (userError) {
    return NextResponse.json({ error: userError.message }, { status: 500 });
  }

  // Insert roles
  if (roles && roles.length > 0) {
    const roleInserts = roles.map((r: string) => ({ username, role_type: r }));
    await supabase.from("user_role_assignments").insert(roleInserts);
  }

  return NextResponse.json({ success: true });
}
