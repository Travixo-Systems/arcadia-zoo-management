import { cookies } from "next/headers";
import { createClient } from "./supabase-server";
import type { SessionUser, UserRole } from "@/types";

const SESSION_COOKIE = "zoo_session";

export async function getSession(): Promise<SessionUser | null> {
  const cookieStore = await cookies();
  const session = cookieStore.get(SESSION_COOKIE);
  if (!session?.value) return null;
  try {
    return JSON.parse(session.value) as SessionUser;
  } catch {
    return null;
  }
}

export async function setSession(user: SessionUser) {
  const cookieStore = await cookies();
  cookieStore.set(SESSION_COOKIE, JSON.stringify(user), {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "lax",
    maxAge: 60 * 60 * 24, // 24 hours
    path: "/",
  });
}

export async function clearSession() {
  const cookieStore = await cookies();
  cookieStore.delete(SESSION_COOKIE);
}

export async function requireAuth(
  allowedRoles?: UserRole[]
): Promise<SessionUser> {
  const session = await getSession();
  if (!session) {
    throw new Error("UNAUTHORIZED");
  }
  if (allowedRoles && !allowedRoles.includes(session.role)) {
    throw new Error("FORBIDDEN");
  }
  return session;
}

export async function getUserRoles(username: string): Promise<UserRole[]> {
  const supabase = await createClient();
  const { data } = await supabase
    .from("user_role_assignments")
    .select("role_type")
    .eq("username", username);
  return (data?.map((r) => r.role_type as UserRole)) ?? [];
}
