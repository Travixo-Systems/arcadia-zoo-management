"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import CrudTable from "@/components/CrudTable";
import Link from "next/link";

interface ReportRow { report_id: number; animal_name: string; vet_name: string; report_date: string; health_status: string; treatment: string; follow_up_date: string; [key: string]: unknown; }

export default function ManageVetReports() {
  const router = useRouter();
  const [reports, setReports] = useState<ReportRow[]>([]);
  const [form, setForm] = useState({ animal_id: "", vet_username: "", report_date: "", health_status: "", treatment: "", weight_at_checkup: "", follow_up_date: "", habitat_comments: "" });
  const [editId, setEditId] = useState<number | null>(null);

  async function load() {
    const res = await fetch("/api/vet-reports");
    setReports(await res.json());
  }

  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const method = editId ? "PUT" : "POST";
    const body = editId
      ? { report_id: editId, ...form, animal_id: Number(form.animal_id), weight_at_checkup: form.weight_at_checkup ? Number(form.weight_at_checkup) : null }
      : { ...form, animal_id: Number(form.animal_id), weight_at_checkup: form.weight_at_checkup ? Number(form.weight_at_checkup) : null };
    await fetch("/api/vet-reports", { method, headers: { "Content-Type": "application/json" }, body: JSON.stringify(body) });
    setForm({ animal_id: "", vet_username: "", report_date: "", health_status: "", treatment: "", weight_at_checkup: "", follow_up_date: "", habitat_comments: "" });
    setEditId(null);
    load();
    router.refresh();
  }

  return (
    <div className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Veterinary Reports</h1>
        <Link href="/dashboard/admin" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <CrudTable
        columns={[
          { key: "animal_name", label: "Animal" },
          { key: "vet_name", label: "Vet" },
          { key: "report_date", label: "Date" },
          { key: "health_status", label: "Status" },
          { key: "treatment", label: "Treatment" },
          { key: "follow_up_date", label: "Follow-Up" },
        ]}
        rows={reports}
        idKey="report_id"
        deleteEndpoint="/api/vet-reports"
        onDelete={load}
      />

      <h2 className="text-zoo-green text-xl font-bold mt-8 mb-4">{editId ? "Edit Report" : "Add Report"}</h2>
      <form onSubmit={handleSubmit} className="bg-zoo-bg p-6 rounded shadow space-y-3">
        <input type="number" placeholder="Animal ID" required value={form.animal_id} onChange={e => setForm({ ...form, animal_id: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Vet Username" required value={form.vet_username} onChange={e => setForm({ ...form, vet_username: e.target.value })} className="w-full p-2 border rounded" />
        <input type="date" required value={form.report_date} onChange={e => setForm({ ...form, report_date: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Health Status" required value={form.health_status} onChange={e => setForm({ ...form, health_status: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Treatment" value={form.treatment} onChange={e => setForm({ ...form, treatment: e.target.value })} className="w-full p-2 border rounded" />
        <input type="number" step="0.01" placeholder="Weight at Checkup" value={form.weight_at_checkup} onChange={e => setForm({ ...form, weight_at_checkup: e.target.value })} className="w-full p-2 border rounded" />
        <input type="date" placeholder="Follow-up Date" value={form.follow_up_date} onChange={e => setForm({ ...form, follow_up_date: e.target.value })} className="w-full p-2 border rounded" />
        <textarea placeholder="Habitat Comments" value={form.habitat_comments} onChange={e => setForm({ ...form, habitat_comments: e.target.value })} className="w-full p-2 border rounded" />
        <button type="submit" className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover">
          {editId ? "Update Report" : "Add Report"}
        </button>
      </form>
    </div>
  );
}
