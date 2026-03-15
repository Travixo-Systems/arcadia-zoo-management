import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function GET() {
  const supabase = await createClient();
  const { data } = await supabase
    .from("veterinary_reports")
    .select("*, animals(prenom), users(name)")
    .order("report_date", { ascending: false });
  const mapped = data?.map((r) => ({
    ...r,
    animal_name: (r.animals as { prenom: string } | null)?.prenom ?? "",
    vet_name: (r.users as { name: string } | null)?.name ?? "",
  }));
  return NextResponse.json(mapped ?? []);
}

export async function POST(request: Request) {
  try { await requireAuth(["admin", "vet"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const supabase = await createClient();
  const { error } = await supabase.from("veterinary_reports").insert(body);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}

export async function PUT(request: Request) {
  try { await requireAuth(["admin", "vet"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }
  const body = await request.json();
  const { report_id, ...updates } = body;
  const supabase = await createClient();
  const { error } = await supabase.from("veterinary_reports").update(updates).eq("report_id", report_id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
