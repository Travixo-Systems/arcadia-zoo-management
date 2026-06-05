import Link from "next/link";
import { createClient } from "@/lib/supabase-server";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  const supabase = await createClient();

  const [{ data: animals }, { data: habitats }, { data: services }, { data: reviews }] =
    await Promise.all([
      supabase.from("animals").select("id, prenom, race, description, image_url").limit(8),
      supabase.from("habitats").select("id, name, image_url"),
      supabase.from("services").select("id, name, description, price, image_url").limit(3),
      supabase.from("reviews").select("visitor_name, review, rating").eq("approved", true).limit(3),
    ]);

  const heroImage =
    habitats?.find((h) => h.name === "Savanna")?.image_url ??
    "https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?w=1600&q=80";

  return (
    <>
      {/* ── HERO ───────────────────────────────────────────── */}
      <section className="relative h-[70vh] min-h-[460px] w-full overflow-hidden">
        <img src={heroImage} alt="" className="absolute inset-0 h-full w-full object-cover" />
        <div className="absolute inset-0 bg-gradient-to-b from-black/40 via-black/30 to-black/70" />
        <div className="relative z-10 flex h-full flex-col items-center justify-center px-4 text-center text-white">
          <p className="mb-3 text-sm font-semibold uppercase tracking-[0.2em] text-white/80">
            Welcome to
          </p>
          <h1 className="max-w-3xl text-4xl font-extrabold leading-tight drop-shadow-md sm:text-6xl">
            Zoo Arcadia
          </h1>
          <p className="mt-4 max-w-xl text-lg text-white/90 drop-shadow">
            Eight immersive habitats. Hundreds of stories. One unforgettable day
            with the wild.
          </p>
          <div className="mt-8 flex flex-wrap items-center justify-center gap-3">
            <Link
              href="/bookings"
              className="rounded-full bg-zoo-green px-7 py-3 font-semibold text-white shadow-lg transition hover:bg-zoo-green-hover"
            >
              Book Your Visit
            </Link>
            <Link
              href="/animals"
              className="rounded-full bg-white/15 px-7 py-3 font-semibold text-white ring-1 ring-white/40 backdrop-blur transition hover:bg-white/25"
            >
              Meet the Animals
            </Link>
          </div>
        </div>
      </section>

      {/* ── ABOUT ──────────────────────────────────────────── */}
      <section className="py-12">
        <div className="mx-auto max-w-3xl px-4 text-center">
          <h2 className="text-zoo-green text-3xl font-bold">A Living World of Wildlife</h2>
          <p className="mt-4 text-lg leading-relaxed text-gray-600">
            From the open savanna to the depths of the aquatic zone, Zoo Arcadia is
            home to species from every corner of the planet. We create safe,
            enriching environments where animals thrive — and where visitors
            reconnect with the natural world.
          </p>
        </div>
      </section>

      {/* ── EXPLORE HABITATS (all of them) ─────────────────── */}
      <section className="bg-zoo-bg py-12">
        <div className="mx-auto max-w-6xl px-4">
          <div className="mb-8 text-center">
            <h2 className="text-zoo-green text-3xl font-bold">Explore Our Habitats</h2>
            <p className="mt-2 text-gray-500">Step into {habitats?.length ?? 8} distinct worlds</p>
          </div>
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            {habitats?.map((h) => (
              <Link
                key={h.id}
                href={`/animals#${h.name.toLowerCase().replace(/ /g, "-")}`}
                className="group relative h-40 overflow-hidden rounded-xl shadow-sm"
              >
                {h.image_url && (
                  <img
                    src={h.image_url}
                    alt={h.name}
                    className="absolute inset-0 h-full w-full object-cover transition duration-300 group-hover:scale-110"
                  />
                )}
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent" />
                <span className="absolute bottom-3 left-3 font-bold text-white drop-shadow">
                  {h.name}
                </span>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* ── FEATURED ANIMALS (8) ───────────────────────────── */}
      <section className="py-12">
        <div className="mx-auto max-w-6xl px-4">
          <div className="mb-8 text-center">
            <h2 className="text-zoo-green text-3xl font-bold">Meet Our Animals</h2>
            <p className="mt-2 text-gray-500">A few of the residents waiting to meet you</p>
          </div>
          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {animals?.map((animal) => (
              <Link
                key={animal.id}
                href={`/animals/${animal.id}`}
                className="group flex flex-col overflow-hidden rounded-lg border border-gray-200 bg-white shadow-sm transition duration-200 hover:-translate-y-1 hover:border-zoo-green hover:shadow-lg"
              >
                {animal.image_url && (
                  <div className="overflow-hidden">
                    <img
                      src={animal.image_url}
                      alt={animal.prenom}
                      className="h-44 w-full object-cover object-[center_30%] transition duration-300 group-hover:scale-105"
                    />
                  </div>
                )}
                <div className="flex flex-1 flex-col p-4">
                  <h5 className="font-bold text-zoo-green">{animal.prenom}</h5>
                  <p className="text-xs text-gray-500">{animal.race}</p>
                  <p className="mt-1 line-clamp-2 text-sm text-gray-600">
                    {animal.description}
                  </p>
                </div>
              </Link>
            ))}
          </div>
          <div className="mt-8 text-center">
            <Link
              href="/animals"
              className="inline-block rounded-full bg-zoo-green px-7 py-3 font-semibold text-white transition hover:bg-zoo-green-hover"
            >
              View All Animals
            </Link>
          </div>
        </div>
      </section>

      {/* ── EVENTS & EXPERIENCES ───────────────────────────── */}
      {services && services.length > 0 && (
        <section className="bg-zoo-bg py-12">
          <div className="mx-auto max-w-6xl px-4">
            <div className="mb-8 text-center">
              <h2 className="text-zoo-green text-3xl font-bold">Events &amp; Experiences</h2>
              <p className="mt-2 text-gray-500">Go beyond the path with our signature activities</p>
            </div>
            <div className="grid grid-cols-1 gap-6 md:grid-cols-3">
              {services.map((s) => (
                <div
                  key={s.id}
                  className="flex flex-col overflow-hidden rounded-xl border border-gray-200 bg-white shadow-sm"
                >
                  {s.image_url && (
                    <img src={s.image_url} alt={s.name} className="h-44 w-full object-cover" />
                  )}
                  <div className="flex flex-1 flex-col p-5">
                    <div className="flex items-start justify-between gap-2">
                      <h5 className="text-lg font-bold text-zoo-green">{s.name}</h5>
                      {s.price != null && (
                        <span className="shrink-0 rounded-full bg-zoo-bg px-3 py-1 text-sm font-semibold text-zoo-green-light">
                          €{Number(s.price).toFixed(0)}
                        </span>
                      )}
                    </div>
                    <p className="mt-2 line-clamp-3 flex-1 text-sm text-gray-600">
                      {s.description}
                    </p>
                  </div>
                </div>
              ))}
            </div>
            <div className="mt-8 text-center">
              <Link
                href="/services"
                className="inline-block rounded-full border-2 border-zoo-green px-7 py-3 font-semibold text-zoo-green transition hover:bg-zoo-green hover:text-white"
              >
                See All Experiences
              </Link>
            </div>
          </div>
        </section>
      )}

      {/* ── PLAN YOUR VISIT (CTA band) ─────────────────────── */}
      <section className="bg-zoo-green-light py-14 text-center text-white">
        <div className="mx-auto max-w-3xl px-4">
          <h2 className="text-3xl font-bold">Plan Your Visit</h2>
          <p className="mx-auto mt-3 max-w-xl text-white/90">
            Open every day from 9 AM to 6 PM. Reserve your tickets online and skip
            the queue — adventure awaits.
          </p>
          <Link
            href="/bookings"
            className="mt-6 inline-block rounded-full bg-white px-8 py-3 font-semibold text-zoo-green shadow-lg transition hover:bg-gray-100"
          >
            Book Now
          </Link>
        </div>
      </section>

      {/* ── REVIEWS (moved lower) ──────────────────────────── */}
      <section className="py-12">
        <div className="mx-auto max-w-6xl px-4">
          <div className="mb-8 text-center">
            <h2 className="text-zoo-green text-3xl font-bold">What Visitors Say</h2>
          </div>
          <div className="grid grid-cols-1 gap-6 md:grid-cols-3">
            {reviews?.map((r, i) => (
              <figure key={i} className="rounded-xl border border-gray-200 bg-white p-6 shadow-sm">
                <p className="stars text-lg">
                  {"★".repeat(r.rating)}
                  <span className="text-gray-300">{"★".repeat(5 - r.rating)}</span>
                </p>
                <blockquote className="mt-3 text-gray-600">“{r.review}”</blockquote>
                <figcaption className="mt-4 font-semibold text-zoo-green">
                  — {r.visitor_name}
                </figcaption>
              </figure>
            ))}
            {(!reviews || reviews.length === 0) && (
              <p className="col-span-3 text-center text-gray-500">No reviews yet.</p>
            )}
          </div>
        </div>
      </section>
    </>
  );
}
