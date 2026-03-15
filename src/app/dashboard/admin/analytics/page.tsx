"use client";

import { useEffect, useState } from "react";
import Link from "next/link";

interface ClickStat { id: number; animal_id: number; animal_name: string; click_count: number; first_click: string; last_click: string; }

export default function AnalyticsPage() {
  const [stats, setStats] = useState<ClickStat[]>([]);

  useEffect(() => {
    fetch("/api/analytics").then(r => r.json()).then(setStats).catch(() => {});
  }, []);

  return (
    <div className="max-w-4xl mx-auto px-4 py-8">
      <div className="flex justify-between items-center mb-4">
        <h1 className="text-zoo-green text-3xl font-bold">Animal View Statistics</h1>
        <Link href="/dashboard/admin" className="text-zoo-green font-bold hover:underline">Back to Dashboard</Link>
      </div>

      <div className="overflow-x-auto">
        <table className="w-full border-collapse text-sm">
          <thead>
            <tr>
              <th className="bg-gray-700 text-white p-3 text-left">Animal Name</th>
              <th className="bg-gray-700 text-white p-3 text-left">Total Clicks</th>
              <th className="bg-gray-700 text-white p-3 text-left">First Click</th>
              <th className="bg-gray-700 text-white p-3 text-left">Last Click</th>
            </tr>
          </thead>
          <tbody>
            {stats.map((s) => (
              <tr key={s.id} className="even:bg-gray-50">
                <td className="p-3 border-b">{s.animal_name}</td>
                <td className="p-3 border-b">{s.click_count}</td>
                <td className="p-3 border-b">{new Date(s.first_click).toLocaleDateString()}</td>
                <td className="p-3 border-b">{new Date(s.last_click).toLocaleDateString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {stats.length > 0 && (
        <div className="mt-8 bg-gray-50 p-6 rounded">
          <h2 className="text-xl font-bold mb-4">Click Distribution</h2>
          <div className="space-y-2">
            {stats.map((s) => {
              const max = Math.max(...stats.map(x => x.click_count));
              const pct = max > 0 ? (s.click_count / max) * 100 : 0;
              return (
                <div key={s.id} className="flex items-center gap-3">
                  <span className="w-32 text-sm truncate">{s.animal_name}</span>
                  <div className="flex-1 bg-gray-200 rounded h-6">
                    <div className="bg-blue-500 h-6 rounded text-white text-xs flex items-center px-2" style={{ width: `${pct}%` }}>
                      {s.click_count}
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {stats.length === 0 && <p className="text-gray-500 mt-4">No click data yet.</p>}
    </div>
  );
}
