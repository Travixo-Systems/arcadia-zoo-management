"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import CrudTable from "@/components/CrudTable";
import Link from "next/link";

interface AnimalRow {
  id: number;
  prenom: string;
  species: string;
  habitat_name: string;
  [key: string]: unknown;
}

export default function ManageAnimals() {
  const router = useRouter();
  const [animals, setAnimals] = useState<AnimalRow[]>([]);
  const [habitats, setHabitats] = useState<{ id: number; name: string }[]>([]);
  const [form, setForm] = useState({
    prenom: "", race: "", habitat_id: "", diet: "", description: "", characteristics: "",
    image_url: "", species: "", lifespan: "", size_weight: "", gestation: "",
    natural_habitat: "", native_region: "", lifestyle: "", distinctive_features: "",
  });
  const [editId, setEditId] = useState<number | null>(null);

  async function load() {
    const res = await fetch("/api/animals");
    setAnimals(await res.json());
  }

  useEffect(() => {
    load();
    fetch("/api/animals").then(r => r.json()).then(data => {
      const h = [...new Map(data.map((a: AnimalRow) => [a.habitat_name, a])).values()];
      // Also fetch habitats if available - we'll extract from animal data
    });
    // Fetch from services to also get habitats list via supabase
  }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const method = editId ? "PUT" : "POST";
    const body = editId ? { id: editId, ...form, habitat_id: Number(form.habitat_id) } : { ...form, habitat_id: Number(form.habitat_id) };
    await fetch("/api/animals", {
      method,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(body),
    });
    setForm({ prenom: "", race: "", habitat_id: "", diet: "", description: "", characteristics: "", image_url: "", species: "", lifespan: "", size_weight: "", gestation: "", natural_habitat: "", native_region: "", lifestyle: "", distinctive_features: "" });
    setEditId(null);
    load();
    router.refresh();
  }

  return (
    <div className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Manage Animals</h1>
        <Link href="/dashboard/admin" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <CrudTable
        columns={[
          { key: "prenom", label: "Name" },
          { key: "species", label: "Species" },
          { key: "habitat_name", label: "Habitat" },
        ]}
        rows={animals}
        idKey="id"
        deleteEndpoint="/api/animals"
        onDelete={load}
      />

      <h2 className="text-zoo-green text-xl font-bold mt-8 mb-4">
        {editId ? "Edit Animal" : "Add New Animal"}
      </h2>
      <form onSubmit={handleSubmit} className="bg-zoo-bg p-6 rounded shadow space-y-3">
        <input type="text" placeholder="Name" required value={form.prenom} onChange={e => setForm({ ...form, prenom: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Class, Order, Family" required value={form.race} onChange={e => setForm({ ...form, race: e.target.value })} className="w-full p-2 border rounded" />
        <input type="number" placeholder="Habitat ID" required value={form.habitat_id} onChange={e => setForm({ ...form, habitat_id: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Diet" value={form.diet} onChange={e => setForm({ ...form, diet: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Description" value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Image URL" value={form.image_url} onChange={e => setForm({ ...form, image_url: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Species" value={form.species} onChange={e => setForm({ ...form, species: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Lifespan" value={form.lifespan} onChange={e => setForm({ ...form, lifespan: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Size & Weight" value={form.size_weight} onChange={e => setForm({ ...form, size_weight: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Gestation" value={form.gestation} onChange={e => setForm({ ...form, gestation: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Natural Habitat" value={form.natural_habitat} onChange={e => setForm({ ...form, natural_habitat: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Native Region" value={form.native_region} onChange={e => setForm({ ...form, native_region: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Lifestyle" value={form.lifestyle} onChange={e => setForm({ ...form, lifestyle: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Distinctive Features" value={form.distinctive_features} onChange={e => setForm({ ...form, distinctive_features: e.target.value })} className="w-full p-2 border rounded" />
        <button type="submit" className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover">
          {editId ? "Update Animal" : "Add Animal"}
        </button>
      </form>
    </div>
  );
}
