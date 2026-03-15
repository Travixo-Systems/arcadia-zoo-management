import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";

export async function GET() {
  const supabase = await createClient();
  const { data } = await supabase
    .from("animal_clicks")
    .select("*")
    .order("click_count", { ascending: false });
  return NextResponse.json(data ?? []);
}

export async function POST(request: Request) {
  const { animalId, name } = await request.json();
  if (!animalId || !name) {
    return NextResponse.json({ error: "Invalid data" }, { status: 400 });
  }

  const supabase = await createClient();

  // Try to increment existing record
  const { data: existing } = await supabase
    .from("animal_clicks")
    .select("id, click_count")
    .eq("animal_id", animalId)
    .single();

  if (existing) {
    await supabase
      .from("animal_clicks")
      .update({
        click_count: existing.click_count + 1,
        animal_name: name,
        last_click: new Date().toISOString(),
      })
      .eq("id", existing.id);
  } else {
    await supabase.from("animal_clicks").insert({
      animal_id: animalId,
      animal_name: name,
      click_count: 1,
    });
  }

  return NextResponse.json({ status: "success" });
}
