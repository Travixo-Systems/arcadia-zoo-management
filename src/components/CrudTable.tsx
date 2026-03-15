"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";

interface Column {
  key: string;
  label: string;
}

interface CrudTableProps {
  columns: Column[];
  rows: Record<string, unknown>[];
  idKey: string;
  deleteEndpoint: string;
  editPath?: string;
  onDelete?: () => void;
}

export default function CrudTable({
  columns,
  rows,
  idKey,
  deleteEndpoint,
  editPath,
  onDelete,
}: CrudTableProps) {
  const router = useRouter();
  const [deleting, setDeleting] = useState<string | null>(null);

  async function handleDelete(id: string) {
    if (!confirm("Are you sure you want to delete this item?")) return;
    setDeleting(id);
    await fetch(`${deleteEndpoint}/${id}`, { method: "DELETE" });
    setDeleting(null);
    if (onDelete) onDelete();
    router.refresh();
  }

  return (
    <div className="overflow-x-auto">
      <table className="w-full border-collapse text-sm">
        <thead>
          <tr>
            {columns.map((col) => (
              <th key={col.key} className="bg-zoo-green text-white p-2 text-left border border-gray-300">
                {col.label}
              </th>
            ))}
            <th className="bg-zoo-green text-white p-2 text-left border border-gray-300">Actions</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => (
            <tr key={String(row[idKey])} className="even:bg-gray-50 hover:bg-gray-100">
              {columns.map((col) => (
                <td key={col.key} className="p-2 border border-gray-200">
                  {String(row[col.key] ?? "")}
                </td>
              ))}
              <td className="p-2 border border-gray-200 space-x-2">
                {editPath && (
                  <button
                    onClick={() => router.push(`${editPath}?id=${row[idKey]}`)}
                    className="bg-green-600 text-white px-3 py-1 rounded text-xs hover:bg-green-700"
                  >
                    Edit
                  </button>
                )}
                <button
                  onClick={() => handleDelete(String(row[idKey]))}
                  disabled={deleting === String(row[idKey])}
                  className="bg-red-500 text-white px-3 py-1 rounded text-xs hover:bg-red-600 disabled:opacity-50"
                >
                  {deleting === String(row[idKey]) ? "..." : "Delete"}
                </button>
              </td>
            </tr>
          ))}
          {rows.length === 0 && (
            <tr>
              <td colSpan={columns.length + 1} className="text-center p-4 text-gray-500">
                No records found.
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
}
