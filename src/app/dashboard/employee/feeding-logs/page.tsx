"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import CrudTable from "@/components/CrudTable";
import Link from "next/link";

interface FeedRow { record_id: number; animal_name: string; meal_preparation: string; weight: number; feeding_time: string; [key: string]: unknown; }

export default function FeedingLogs() {
  const router = useRouter();
  const [records, setRecords] = useState<FeedRow[]>([]);
  const [form, setForm] = useState({ animal_id: "", meal_preparation: "", weight: "" });
  const [editId, setEditId] = useState<number | null>(null);

  async function load() {
    const res = await fetch("/api/feeding-records");
    if (res.ok) setRecords(await res.json());
  }

  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const method = editId ? "PUT" : "POST";
    const body = editId
      ? { record_id: editId, animal_id: Number(form.animal_id), meal_preparation: form.meal_preparation, weight: form.weight ? Number(form.weight) : null }
      : { animal_id: Number(form.animal_id), meal_preparation: form.meal_preparation, weight: form.weight ? Number(form.weight) : null };
    await fetch("/api/feeding-records", { method, headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) });
    setForm({ animal_id: "", meal_preparation: "", weight: "" });
    setEditId(null);
    load();
    router.refresh();
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Feeding Records</h1>
        <Link href="/dashboard/employee" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <CrudTable
        columns={[
          { key: "animal_name", label: "Animal" },
          { key: "meal_preparation", label: "Meal" },
          { key: "weight", label: "Weight (kg)" },
          { key: "feeding_time", label: "Time" },
        ]}
        rows={records}
        idKey="record_id"
        deleteEndpoint="/api/feeding-records"
        onDelete={load}
      />

      <h2 className="text-zoo-green text-xl font-bold mt-8 mb-4">{editId ? "Edit Record" : "Add Record"}</h2>
      <form onSubmit={handleSubmit} className="bg-zoo-bg p-6 rounded shadow space-y-3">
        <input type="number" placeholder="Animal ID" required value={form.animal_id} onChange={e => setForm({ ...form, animal_id: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Meal" required value={form.meal_preparation} onChange={e => setForm({ ...form, meal_preparation: e.target.value })} className="w-full p-2 border rounded" />
        <input type="number" step="0.01" placeholder="Weight (kg)" value={form.weight} onChange={e => setForm({ ...form, weight: e.target.value })} className="w-full p-2 border rounded" />
        <button type="submit" className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover">
          {editId ? "Update Record" : "Add Record"}
        </button>
      </form>
    </div>
  );
}
