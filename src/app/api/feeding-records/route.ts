import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function GET() {
  const supabase = await createClient();
  const { data } = await supabase
    .from("feeding_records")
    .select("*, animals(prenom)")
    .order("feeding_time", { ascending: false });
  const mapped = data?.map((r) => ({
    ...r,
    animal_name: (r.animals as { prenom: string } | null)?.prenom ?? "",
  }));
  return NextResponse.json(mapped ?? []);
}

export async function POST(request: Request) {
  try { await requireAuth(["admin", "emp"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const supabase = await createClient();
  const { error } = await supabase.from("feeding_records").insert(body);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}

export async function PUT(request: Request) {
  try { await requireAuth(["admin", "emp"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const { record_id, ...updates } = body;
  const supabase = await createClient();
  const { error } = await supabase.from("feeding_records").update(updates).eq("record_id", record_id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
