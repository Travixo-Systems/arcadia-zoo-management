import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function GET() {
  const supabase = await createClient();
  const { data } = await supabase.from("reviews").select("*").order("review_date", { ascending: false });
  return NextResponse.json(data ?? []);
}

export async function POST(request: Request) {
  const body = await request.json();
  const supabase = await createClient();
  const { error } = await supabase.from("reviews").insert({
    visitor_name: body.visitor_name,
    review: body.review,
    rating: body.rating,
    approved: false,
  });
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}

export async function PUT(request: Request) {
  try { await requireAuth(["admin", "emp"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const supabase = await createClient();
  const { error } = await supabase.from("reviews").update({ approved: body.approved }).eq("id", body.id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
