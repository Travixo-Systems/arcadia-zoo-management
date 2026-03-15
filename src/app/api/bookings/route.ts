import { NextResponse } from "next/server";
import { createClient } from "@/lib/supabase-server";

export async function POST(request: Request) {
  const body = await request.json();
  const supabase = await createClient();

  // Upsert visitor
  const { data: existingVisitor } = await supabase
    .from("visitors")
    .select("username")
    .eq("username", body.visitor_username)
    .single();

  if (!existingVisitor) {
    const { error: vErr } = await supabase.from("visitors").insert({
      username: body.visitor_username,
      name: body.visitor_name,
      lastname: body.visitor_lastname,
    });
    if (vErr) return NextResponse.json({ error: vErr.message }, { status: 500 });
  }

  const { error } = await supabase.from("bookings").insert({
    visitor_username: body.visitor_username,
    service_id: body.service_id,
    booking_date: body.booking_date,
    status: "Pending",
  });

  if (error) return NextResponse.json({ error: error.message }, { status: 500 });
  return NextResponse.json({ success: true });
}
