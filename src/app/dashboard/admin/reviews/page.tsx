"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Link from "next/link";

interface ReviewRow { id: number; visitor_name: string; review: string; rating: number; review_date: string; approved: boolean; }

export default function ManageReviews() {
  const router = useRouter();
  const [reviews, setReviews] = useState<ReviewRow[]>([]);

  async function load() {
    const res = await fetch("/api/reviews");
    setReviews(await res.json());
  }

  useEffect(() => { load(); }, []);

  async function handleApprove(id: number) {
    await fetch("/api/reviews", { method: "PUT", headers: { "Content-Type": "application/json" }, body: JSON.stringify({ id, approved: true }) });
    load();
  }

  async function handleDelete(id: number) {
    if (!confirm("Delete this review?")) return;
    await fetch(`/api/reviews/${id}`, { method: "DELETE" });
    load();
  }

  return (
    <div className="max-w-5xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Manage Reviews</h1>
        <Link href="/dashboard/admin" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <div className="overflow-x-auto">
        <table className="w-full border-collapse text-sm">
          <thead>
            <tr>
              <th className="bg-zoo-green text-white p-2 text-left">Visitor</th>
              <th className="bg-zoo-green text-white p-2 text-left">Review</th>
              <th className="bg-zoo-green text-white p-2 text-left">Rating</th>
              <th className="bg-zoo-green text-white p-2 text-left">Date</th>
              <th className="bg-zoo-green text-white p-2 text-left">Approved</th>
              <th className="bg-zoo-green text-white p-2 text-left">Actions</th>
            </tr>
          </thead>
          <tbody>
            {reviews.map((r) => (
              <tr key={r.id} className="even:bg-gray-50 hover:bg-gray-100">
                <td className="p-2 border">{r.visitor_name}</td>
                <td className="p-2 border max-w-xs truncate">{r.review}</td>
                <td className="p-2 border">{r.rating}/5</td>
                <td className="p-2 border">{new Date(r.review_date).toLocaleDateString()}</td>
                <td className="p-2 border">{r.approved ? "Yes" : "No"}</td>
                <td className="p-2 border space-x-2">
                  {!r.approved && (
                    <button onClick={() => handleApprove(r.id)} className="bg-green-600 text-white px-3 py-1 rounded text-xs hover:bg-green-700">
                      Approve
                    </button>
                  )}
                  <button onClick={() => handleDelete(r.id)} className="bg-red-500 text-white px-3 py-1 rounded text-xs hover:bg-red-600">
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
