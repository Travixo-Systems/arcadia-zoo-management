import { createClient } from "@/lib/supabase-server";

export const dynamic = "force-dynamic";

export default async function ServicesPage() {
  const supabase = await createClient();
  const { data: services } = await supabase
    .from("services")
    .select("*")
    .order("id");

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="text-center mb-8">
        <img src="/images/wild.PNG" alt="Wildlife" className="max-w-xl w-full mx-auto rounded mb-4" />
        <h1 className="text-zoo-green text-3xl font-bold">Explore Our Wide Range of Services</h1>
      </div>

      {services?.map((s) => (
        <div key={s.id} className="bg-white rounded-lg shadow p-6 mb-6 md:flex md:gap-6">
          {s.image_url && (
            <img src={s.image_url} alt={s.name} className="w-full md:w-1/2 h-auto object-cover rounded" />
          )}
          <div className="mt-4 md:mt-0">
            <h2 className="text-zoo-green text-2xl font-bold">{s.name}</h2>
            <p className="text-gray-600 mt-2">{s.description}</p>
            <p className="font-bold mt-2">Price: ${Number(s.price).toFixed(2)}</p>
            <p className="text-gray-500 text-sm">Available: {s.availability_schedule}</p>
          </div>
        </div>
      ))}

      {(!services || services.length === 0) && (
        <p className="text-center text-gray-500">No services available.</p>
      )}
    </div>
  );
}
