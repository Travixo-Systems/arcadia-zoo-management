"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import CrudTable from "@/components/CrudTable";
import Link from "next/link";

interface UserRow { username: string; name: string; lastname: string; age: number | null; roles: string; [key: string]: unknown; }

export default function ManageUsers() {
  const router = useRouter();
  const [users, setUsers] = useState<UserRow[]>([]);
  const [form, setForm] = useState({ username: "", password: "", name: "", lastname: "", age: "", roles: [] as string[] });
  const [editing, setEditing] = useState(false);

  async function load() {
    const res = await fetch("/api/users");
    if (res.ok) setUsers(await res.json());
  }

  useEffect(() => { load(); }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    const endpoint = editing ? "/api/users" : "/api/auth/register";
    const method = editing ? "PUT" : "POST";
    await fetch(endpoint, {
      method,
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ ...form, age: form.age ? Number(form.age) : null }),
    });
    setForm({ username: "", password: "", name: "", lastname: "", age: "", roles: [] });
    setEditing(false);
    load();
    router.refresh();
  }

  function toggleRole(role: string) {
    setForm(prev => ({
      ...prev,
      roles: prev.roles.includes(role) ? prev.roles.filter(r => r !== role) : [...prev.roles, role],
    }));
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Manage Users</h1>
        <Link href="/dashboard/admin" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <CrudTable
        columns={[
          { key: "username", label: "Username" },
          { key: "name", label: "Name" },
          { key: "lastname", label: "Lastname" },
          { key: "age", label: "Age" },
          { key: "roles", label: "Roles" },
        ]}
        rows={users}
        idKey="username"
        deleteEndpoint="/api/users"
        onDelete={load}
      />

      <h2 className="text-zoo-green text-xl font-bold mt-8 mb-4">{editing ? "Edit User" : "Add User"}</h2>
      <form onSubmit={handleSubmit} className="bg-zoo-bg p-6 rounded shadow space-y-3">
        <input type="text" placeholder="Username" required value={form.username} readOnly={editing} onChange={e => setForm({ ...form, username: e.target.value })} className="w-full p-2 border rounded" />
        <input type="password" placeholder="Password" required={!editing} value={form.password} onChange={e => setForm({ ...form, password: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Name" required value={form.name} onChange={e => setForm({ ...form, name: e.target.value })} className="w-full p-2 border rounded" />
        <input type="text" placeholder="Lastname" required value={form.lastname} onChange={e => setForm({ ...form, lastname: e.target.value })} className="w-full p-2 border rounded" />
        <input type="number" placeholder="Age" value={form.age} onChange={e => setForm({ ...form, age: e.target.value })} className="w-full p-2 border rounded" />
        <div className="flex gap-4">
          {["admin", "vet", "emp"].map(role => (
            <label key={role} className="flex items-center gap-1">
              <input type="checkbox" checked={form.roles.includes(role)} onChange={() => toggleRole(role)} />
              {role.charAt(0).toUpperCase() + role.slice(1)}
            </label>
          ))}
        </div>
        <button type="submit" className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover">
          {editing ? "Update User" : "Add User"}
        </button>
      </form>
    </div>
  );
}
