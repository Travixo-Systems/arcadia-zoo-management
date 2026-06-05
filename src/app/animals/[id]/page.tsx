import Link from "next/link";
import { createClient } from "@/lib/supabase-server";
import { notFound } from "next/navigation";

export const dynamic = "force-dynamic";

function StatCard({ label, value }: { label: string; value: string | null }) {
  if (!value) return null;
  return (
    <div className="rounded-lg border border-gray-200 bg-white p-4 shadow-sm">
      <dt className="text-xs font-semibold uppercase tracking-wide text-zoo-green-light">
        {label}
      </dt>
      <dd className="mt-1 text-gray-800">{value}</dd>
    </div>
  );
}

function Panel({ title, children }: { title: string; children: React.ReactNode }) {
  return (
    <section className="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
      <h3 className="mb-3 text-2xl font-bold text-zoo-green-light">{title}</h3>
      {children}
    </section>
  );
}

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
    <main className="max-w-4xl mx-auto px-4 py-8 space-y-8">
      <Link
        href="/animals"
        className="inline-flex items-center gap-1 text-sm font-medium text-zoo-green hover:text-zoo-green-hover"
      >
        <span aria-hidden>←</span> Back to animals
      </Link>

      {/* Hero */}
      <section className="overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm">
        {animal.image_url && (
          <img
            src={animal.image_url}
            alt={animal.prenom}
            className="h-72 w-full object-cover sm:h-96"
          />
        )}
        <div className="p-6">
          <h2 className="text-zoo-green text-4xl font-bold">{animal.prenom}</h2>
          <p className="mt-1 text-lg italic text-gray-500">{animal.species}</p>
          <div className="mt-3 flex flex-wrap gap-2">
            {animal.race && (
              <span className="rounded-full bg-zoo-bg px-3 py-1 text-sm text-zoo-green-light">
                {animal.race}
              </span>
            )}
            {animal.diet && (
              <span className="rounded-full bg-zoo-bg px-3 py-1 text-sm text-zoo-green-light">
                {animal.diet}
              </span>
            )}
          </div>
          {animal.description && (
            <p className="mt-4 text-gray-600">{animal.description}</p>
          )}
        </div>
      </section>

      {/* Identity Card as a stat grid */}
      <section>
        <h3 className="mb-4 text-2xl font-bold text-zoo-green-light">Identity Card</h3>
        <dl className="grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-3">
          <StatCard label="Class, Order & Family" value={animal.race} />
          <StatCard label="Species" value={animal.species} />
          <StatCard label="Lifespan" value={animal.lifespan} />
          <StatCard label="Size & Weight" value={animal.size_weight} />
          <StatCard label="Gestation" value={animal.gestation} />
          <StatCard label="Natural Habitat" value={animal.natural_habitat} />
          <StatCard label="Diet" value={animal.diet} />
          <StatCard label="Native Region" value={animal.native_region} />
        </dl>
      </section>

      {animal.lifestyle && (
        <Panel title="Lifestyle">
          <p className="whitespace-pre-line text-gray-600">{animal.lifestyle}</p>
        </Panel>
      )}

      {animal.distinctive_features && (
        <Panel title="Distinctive Features">
          <p className="whitespace-pre-line text-gray-600">{animal.distinctive_features}</p>
        </Panel>
      )}
    </main>
  );
}
