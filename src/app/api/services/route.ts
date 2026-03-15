import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function GET() {
  const supabase = await createClient();
  const { data } = await supabase.from("services").select("id, name, description, price, availability_schedule, image_url").order("id");
  return NextResponse.json(data ?? []);
}

export async function POST(request: Request) {
  try { await requireAuth(["admin"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const supabase = await createClient();
  const { error } = await supabase.from("services").insert(body);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}

export async function PUT(request: Request) {
  try { await requireAuth(["admin"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const { id, ...updates } = body;
  const supabase = await createClient();
  const { error } = await supabase.from("services").update(updates).eq("id", id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
