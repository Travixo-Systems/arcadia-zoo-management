import { NextResponse } from "next/server";
import bcrypt from "bcryptjs";
import { createClient } from "@/lib/supabase-server";
import { setSession, getUserRoles } from "@/lib/auth";

const dashboardPaths: Record<string, string> = {
  admin: "/dashboard/admin",
  vet: "/dashboard/vet",
  emp: "/dashboard/employee",
};

export async function POST(request: Request) {
  const { username, password } = await request.json();

  if (!username || !password) {
    return NextResponse.json({ error: "Username and password required" }, { status: 400 });
  }

  const supabase = await createClient();
  const { data: user } = await supabase
    .from("users")
    .select("username, password")
    .eq("username", username)
    .single();

  if (!user) {
    return NextResponse.json({ error: "Invalid username or password" }, { status: 401 });
  }

  const valid = await bcrypt.compare(password, user.password);
  if (!valid) {
    return NextResponse.json({ error: "Invalid username or password" }, { status: 401 });
  }

  const roles = await getUserRoles(username);
  if (roles.length === 0) {
    return NextResponse.json({ error: "No roles assigned to this account" }, { status: 403 });
  }

  const primaryRole = roles.includes("admin") ? "admin" : roles.includes("vet") ? "vet" : "emp";
  await setSession({ username, role: primaryRole });

  return NextResponse.json({ redirect: dashboardPaths[primaryRole] || "/dashboard/admin" });
}
