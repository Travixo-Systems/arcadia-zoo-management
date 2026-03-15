import { createClient } from "@/lib/supabase-server";
import { notFound } from "next/navigation";

export const dynamic = "force-dynamic";

export default async function AnimalDetailPage({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const supabase = await createClient();

  const { data: animal } = await supabase
    .from("animals")
    .select("*")
    .eq("id", id)
    .single();

  if (!animal) notFound();

  return (
    <main className="max-w-4xl mx-auto px-4 py-8">
      <section className="text-center mb-8">
        <h2 className="text-zoo-green text-5xl font-bold mb-6">{animal.prenom}</h2>
        {animal.image_url && (
          <img
            src={animal.image_url}
            alt={animal.prenom}
            className="max-w-full h-auto mx-auto rounded shadow"
          />
        )}
      </section>

      <section className="text-center mb-8">
        <h3 className="text-zoo-green-light text-3xl font-bold mb-4">Identity Card</h3>
        <div className="text-lg text-gray-600 space-y-2">
          <p><strong>Class, Order, and Family:</strong> {animal.race}</p>
          <p><strong>Species:</strong> {animal.species}</p>
          <p><strong>Lifespan:</strong> {animal.lifespan}</p>
          <p><strong>Size &amp; Weight:</strong> {animal.size_weight}</p>
          <p><strong>Gestation:</strong> {animal.gestation}</p>
          <p><strong>Natural Habitat:</strong> {animal.natural_habitat}</p>
          <p><strong>Diet:</strong> {animal.diet}</p>
          <p><strong>Native Region:</strong> {animal.native_region}</p>
        </div>
      </section>

      {animal.lifestyle && (
        <section className="text-center mb-8">
          <h3 className="text-zoo-green-light text-3xl font-bold mb-4">Lifestyle</h3>
          <p className="text-lg text-gray-600 whitespace-pre-line">{animal.lifestyle}</p>
        </section>
      )}

      {animal.distinctive_features && (
        <section className="text-center mb-8">
          <h3 className="text-zoo-green-light text-3xl font-bold mb-4">Distinctive Features</h3>
          <p className="text-lg text-gray-600 whitespace-pre-line">{animal.distinctive_features}</p>
        </section>
      )}
    </main>
  );
}
