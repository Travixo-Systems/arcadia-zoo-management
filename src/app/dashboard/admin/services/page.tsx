"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import CrudTable from "@/components/CrudTable";
import Link from "next/link";

interface ServiceRow { id: number; name: string; description: string; price: number; availability_schedule: string; [key: string]: unknown; }

export default function ManageServices() {
  const router = useRouter();
  const [services, setServices] = useState<ServiceRow[]>([]);
  const [form, setForm] = useState({ name: "", description: "", price: "", availability_schedule: "", image_url: "" });
  const [editId, setEditId] = useState<number | null>(null);

  async function load() {
    const res = await fetch("/api/services");
    setServices(await res.json());
  }

  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const method = editId ? "PUT" : "POST";
    const body = editId ? { id: editId, ...form, price: Number(form.price) } : { ...form, price: Number(form.price) };
    await fetch("/api/services", { method, headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) });
    setForm({ name: "", description: "", price: "", availability_schedule: "", image_url: "" });
    setEditId(null);
    load();
    router.refresh();
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Manage Services</h1>
        <Link href="/dashboard/admin" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <CrudTable
        columns={[
          { key: "name", label: "Name" },
          { key: "description", label: "Description" },
          { key: "price", label: "Price" },
          { key: "availability_schedule", label: "Schedule" },
        ]}
        rows={services}
        idKey="id"
        deleteEndpoint="/api/services"
        onDelete={load}
      />

      <h2 className="text-zoo-green text-xl font-bold mt-8 mb-4">{editId ? "Edit Service" : "Add Service"}</h2>
      <form onSubmit={handleSubmit} className="bg-zoo-bg p-6 rounded shadow space-y-3">
        <input type="text" placeholder="Service Name" required value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Description" required value={form.description} onChange={e => setForm({ ...form, description: e.target.value })} className="w-full p-2 border rounded" />
        <input type="number" step="0.01" placeholder="Price" required value={form.price} onChange={e => setForm({ ...form, price: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Availability Schedule" value={form.availability_schedule} onChange={e => setForm({ ...form, availability_schedule: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Image URL" value={form.image_url} onChange={e => setForm({ ...form, image_url: e.target.value })} className="w-full p-2 border rounded" />
        <button type="submit" className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover">
          {editId ? "Update Service" : "Add Service"}
        </button>
      </form>
    </div>
  );
}
