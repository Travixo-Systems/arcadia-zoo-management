import Link from "next/link";
import { createClient } from "@/lib/supabase-server";
import ClickTracker from "./ClickTracker";

export const dynamic = "force-dynamic";

export default async function AnimalsPage() {
  const supabase = await createClient();

  const { data: animals } = await supabase
    .from("animals")
    .select("id, prenom, race, diet, description, image_url, habitat_id, habitats(name, image_url)")
    .order("habitat_id");

  // Group by habitat
  const grouped: Record<string, { habitatName: string; habitatImage: string | null; animals: typeof animals }> = {};
  animals?.forEach((a) => {
    const habitat = (a.habitats as unknown as { name: string; image_url: string | null } | null);
    const name = habitat?.name ?? "Unknown";
    if (!grouped[name]) {
      grouped[name] = { habitatName: name, habitatImage: habitat?.image_url ?? null, animals: [] };
    }
    grouped[name].animals!.push(a);
  });

  return (
    <div className="max-w-6xl mx-auto px-4 py-8">
      {Object.entries(grouped).map(([habitat, data]) => (
        <div key={habitat} id={habitat.toLowerCase().replace(/ /g, "-")}>
          <h2 className="text-zoo-green text-4xl font-bold text-center mt-8 mb-4">
            {data.habitatName}
          </h2>
          {data.habitatImage && (
            <img
              src={data.habitatImage}
              alt={`${data.habitatName} Habitat`}
              className="w-full max-h-80 object-cover rounded mb-6"
            />
          )}
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            {data.animals?.map((animal) => (
              <div key={animal.id} className="bg-white rounded shadow overflow-hidden border border-gray-200">
                {animal.image_url && (
                  <img
                    src={animal.image_url}
                    alt={animal.prenom}
                    className="w-full h-52 object-cover"
                  />
                )}
                <div className="p-4 text-center">
                  <h5 className="font-bold text-lg">{animal.prenom}</h5>
                  <p className="text-gray-500 text-sm">
                    {animal.race} - {animal.diet}
                  </p>
                  <p className="text-sm mt-1">
                    {animal.description?.substring(0, 60)}...
                  </p>
                  <ClickTracker animalId={animal.id} animalName={animal.prenom}>
                    <Link
                      href={`/animals/${animal.id}`}
                      className="inline-block mt-3 bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 text-sm"
                    >
                      Learn More
                    </Link>
                  </ClickTracker>
                </div>
              </div>
            ))}
          </div>
        </div>
      ))}
      {(!animals || animals.length === 0) && (
        <p className="text-center text-gray-500 py-10">No animals found.</p>
      )}
    </div>
  );
}
