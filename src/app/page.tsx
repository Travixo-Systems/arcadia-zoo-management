import Link from "next/link";
import { createClient } from "@/lib/supabase-server";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  const supabase = await createClient();

  const { data: animals } = await supabase
    .from("animals")
    .select("id, prenom, race, description, image_url")
    .limit(3);

  const { data: reviews } = await supabase
    .from("reviews")
    .select("visitor_name, review, rating")
    .eq("approved", true)
    .limit(3);

  const { data: habitats } = await supabase
    .from("habitats")
    .select("id, name, image_url")
    .limit(3);

  return (
    <>
      {/* About Section */}
      <section className="py-8">
        <div className="max-w-4xl mx-auto text-center px-4">
          <h2 className="text-zoo-green text-3xl font-bold mb-4">About Our Zoo</h2>
          <p className="text-lg text-gray-600">
            Our zoo is home to a wide variety of animals from all around the globe.
            We strive to create a safe, enriching environment for both our animals
            and visitors. Visit us and experience the magic of wildlife up close.
          </p>
        </div>
      </section>

      {/* Featured Animals */}
      <section className="py-8 bg-gray-50">
        <div className="max-w-6xl mx-auto px-4">
          <h2 className="text-zoo-green text-3xl font-bold text-center mb-6">
            Meet Our Featured Animals
          </h2>
          <div className="grid md:grid-cols-3 gap-6">
            {animals?.map((animal) => (
              <div key={animal.id} className="bg-white rounded shadow overflow-hidden hover:shadow-lg transition">
                {animal.image_url && (
                  <img
                    src={animal.image_url}
                    alt={animal.race}
                    className="w-full h-48 object-cover"
                  />
                )}
                <div className="p-4">
                  <h5 className="font-bold text-lg">{animal.prenom}</h5>
                  <p className="text-gray-600 text-sm mt-1">{animal.description}</p>
                </div>
              </div>
            ))}
          </div>
          <div className="text-center mt-6">
            <Link
              href="/animals"
              className="bg-zoo-green text-white px-6 py-3 rounded hover:bg-zoo-green-hover transition inline-block"
            >
              View All Animals
            </Link>
          </div>
        </div>
      </section>

      {/* Reviews */}
      <section className="py-8">
        <div className="max-w-6xl mx-auto px-4">
          <h2 className="text-zoo-green text-3xl font-bold text-center mb-6">
            Visitor Reviews
          </h2>
          <div className="grid md:grid-cols-3 gap-6">
            {reviews?.map((r, i) => (
              <div key={i} className="bg-white rounded shadow p-4">
                <h5 className="font-bold">{r.visitor_name}</h5>
                <p className="text-gray-600 text-sm mt-1">{r.review}</p>
                <p className="stars mt-2">{"★".repeat(r.rating)}{"☆".repeat(5 - r.rating)}</p>
              </div>
            ))}
            {(!reviews || reviews.length === 0) && (
              <p className="col-span-3 text-center text-gray-500">No reviews yet.</p>
            )}
          </div>
        </div>
      </section>

      {/* Habitats */}
      <section className="py-8 bg-gray-50">
        <div className="max-w-6xl mx-auto px-4">
          <h2 className="text-zoo-green text-3xl font-bold text-center mb-6">
            Explore Our Habitats
          </h2>
          <div className="grid md:grid-cols-3 gap-6">
            {habitats?.map((h) => (
              <Link key={h.id} href={`/animals#${h.name.toLowerCase().replace(/ /g, "-")}`}>
                <div className="bg-white rounded shadow overflow-hidden hover:shadow-lg transition">
                  {h.image_url && (
                    <img src={h.image_url} alt={h.name} className="w-full h-48 object-cover" />
                  )}
                  <div className="p-4 text-center">
                    <h5 className="font-bold text-lg">{h.name}</h5>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* Visit */}
      <section className="py-8">
        <div className="max-w-4xl mx-auto text-center px-4">
          <h2 className="text-zoo-green text-3xl font-bold mb-4">Plan Your Visit</h2>
          <p className="text-lg text-gray-600 mb-4">
            Our zoo is open every day from 9 AM to 6 PM. Come and explore the wild!
          </p>
          <Link
            href="/bookings"
            className="bg-zoo-green text-white px-6 py-3 rounded hover:bg-zoo-green-hover transition inline-block"
          >
            Book Now
          </Link>
        </div>
      </section>
    </>
  );
}
