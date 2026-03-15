import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";
import { requireAuth } from "@/lib/auth";

export async function GET() {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("animals")
    .select("*, habitats(name)")
    .order("id");
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  const mapped = data?.map((a) => ({
    ...a,
    habitat_name: (a.habitats as { name: string } | null)?.name ?? "",
  }));
  return NextResponse.json(mapped);
}

export async function POST(request: Request) {
  try { await requireAuth(["admin"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }

  const body = await request.json();
  const supabase = await createClient();
  const { error } = await supabase.from("animals").insert(body);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}

export async function PUT(request: Request) {
  try { await requireAuth(["admin"]); } catch { return NextResponse.json({ error: "Unauthorized" }, { status: 401 }); }

  const body = await request.json();
  const { id, ...updates } = body;
  const supabase = await createClient();
  const { error } = await supabase.from("animals").update(updates).eq("id", id);
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
