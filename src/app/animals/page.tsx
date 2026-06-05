import { createClient } from "@/lib/supabase-server";
import ClickTracker from "./ClickTracker";

export const dynamic = "force-dynamic";

// Per-animal thumbnail focal point so the head stays in frame when the card
// crops the image. Falls back to DEFAULT_FOCUS for everything else.
const DEFAULT_FOCUS = "center 30%";
const IMAGE_FOCUS: Record<string, string> = {
  Zazu: "top",     // ground hornbill — head sits high
  Kondo: "top",    // gorilla — keep the face
  Blizzard: "top", // arctic fox — face near top
  Frost: "top",    // penguin — head near top
};

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
              <ClickTracker
                key={animal.id}
                animalId={animal.id}
                animalName={animal.prenom}
                href={`/animals/${animal.id}`}
                className="group flex flex-col bg-white rounded-lg shadow-sm overflow-hidden border border-gray-200 transition duration-200 hover:-translate-y-1 hover:shadow-lg hover:border-zoo-green focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-zoo-green"
              >
                {animal.image_url && (
                  <div className="overflow-hidden">
                    <img
                      src={animal.image_url}
                      alt={animal.prenom}
                      style={{ objectPosition: IMAGE_FOCUS[animal.prenom] ?? DEFAULT_FOCUS }}
                      className="w-full h-56 object-cover transition duration-300 group-hover:scale-105"
                    />
                  </div>
                )}
                <div className="flex flex-col flex-1 p-4 text-center">
                  <h5 className="font-bold text-lg text-zoo-green">{animal.prenom}</h5>
                  <p className="text-gray-500 text-sm">
                    {animal.race} - {animal.diet}
                  </p>
                  <p className="text-sm mt-1 text-gray-600">
                    {animal.description?.substring(0, 60)}...
                  </p>
                  <span className="mt-auto pt-3 inline-flex items-center justify-center gap-1 text-sm font-medium text-zoo-green group-hover:text-zoo-green-hover">
                    Learn More
                    <span aria-hidden className="transition-transform duration-200 group-hover:translate-x-1">→</span>
                  </span>
                </div>
              </ClickTracker>
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
