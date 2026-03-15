"use client";

import { useState, useEffect } from "react";

interface ServiceOption {
  id: number;
  name: string;
}

export default function BookingsPage() {
  const [services, setServices] = useState<ServiceOption[]>([]);
  const [status, setStatus] = useState<"idle" | "sending" | "sent" | "error">("idle");

  useEffect(() => {
    fetch("/api/services")
      .then((r) => r.json())
      .then((d) => setServices(d))
      .catch(() => {});
  }, []);

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setStatus("sending");
    const form = new FormData(e.currentTarget);
    const res = await fetch("/api/bookings", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        visitor_username: form.get("visitor_username"),
        visitor_name: form.get("visitor_name"),
        visitor_lastname: form.get("visitor_lastname"),
        service_id: Number(form.get("service_id")),
        booking_date: form.get("booking_date"),
      }),
    });
    setStatus(res.ok ? "sent" : "error");
    if (res.ok) (e.target as HTMLFormElement).reset();
  }

  return (
    <div className="max-w-2xl mx-auto px-4 py-8">
      <h2 className="text-zoo-green text-3xl font-bold mb-6">Book Your Zoo Tour</h2>

      {status === "sent" && (
        <p className="text-green-600 mb-4 font-semibold">Booking created successfully!</p>
      )}
      {status === "error" && (
        <p className="text-red-500 mb-4">Error creating booking. Please try again.</p>
      )}

      <form onSubmit={handleSubmit} className="bg-white p-6 rounded shadow space-y-4">
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Reservation Name</label>
          <input type="text" name="visitor_username" required placeholder="team_simba, mowgli_crew" className="w-full p-2 border rounded" />
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-zoo-green font-semibold mb-1">First Name</label>
            <input type="text" name="visitor_name" required className="w-full p-2 border rounded" />
          </div>
          <div>
            <label className="block text-zoo-green font-semibold mb-1">Last Name</label>
            <input type="text" name="visitor_lastname" required className="w-full p-2 border rounded" />
          </div>
        </div>
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Choose Tour</label>
          <select name="service_id" required className="w-full p-2 border rounded">
            {services.map((s) => (
              <option key={s.id} value={s.id}>{s.name}</option>
            ))}
          </select>
        </div>
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Date</label>
          <input type="date" name="booking_date" required className="w-full p-2 border rounded" />
        </div>
        <button
          type="submit"
          disabled={status === "sending"}
          className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover disabled:opacity-50"
        >
          {status === "sending" ? "Booking..." : "Send Reservation"}
        </button>
      </form>
    </div>
  );
}
