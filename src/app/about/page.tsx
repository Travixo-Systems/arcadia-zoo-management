import { createClient } from "@/lib/supabase-server";

export const dynamic = "force-dynamic";

export default async function AboutPage() {
  const supabase = await createClient();
  const { data: contactInfo } = await supabase.from("contact_info").select("type, value");

  const info: Record<string, string> = {};
  contactInfo?.forEach((c) => { info[c.type] = c.value; });

  return (
    <div className="max-w-3xl mx-auto px-4 py-8 space-y-8">
      <section>
        <h2 className="text-zoo-green text-3xl font-bold mb-4">Contact Information</h2>
        <p><strong>Address:</strong> {info.Address || "Not available"}</p>
        <p><strong>Phone:</strong> {info.Phone || "Not available"}</p>
        <p><strong>Email:</strong> {info.Email || "Not available"}</p>
      </section>

      <section>
        <h2 className="text-zoo-green text-3xl font-bold mb-4">Business Hours</h2>
        <p>{info.Hours || "Not available"}</p>
      </section>

      <section>
        <h2 className="text-zoo-green text-3xl font-bold mb-4">Follow Us</h2>
        <p className="space-x-4">
          <a href="#" className="text-zoo-green hover:underline">Facebook</a>
          <a href="#" className="text-zoo-green hover:underline">Twitter</a>
          <a href="#" className="text-zoo-green hover:underline">Instagram</a>
          <a href="#" className="text-zoo-green hover:underline">LinkedIn</a>
        </p>
      </section>

      <section>
        <h2 className="text-zoo-green text-3xl font-bold mb-4">Location</h2>
        {/* Add Google Maps embed URL here */}
        <p className="text-gray-500 italic">Map embed coming soon.</p>
      </section>

      <section>
        <h2 className="text-zoo-green text-3xl font-bold mb-4">Accessibility</h2>
        <p>Information on accessible entrances and facilities.</p>
      </section>
    </div>
  );
}
