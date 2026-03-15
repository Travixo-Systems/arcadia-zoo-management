"use client";

import { useState } from "react";

export default function ContactPage() {
  const [status, setStatus] = useState<"idle" | "sending" | "sent" | "error">("idle");

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setStatus("sending");
    const form = new FormData(e.currentTarget);
    const res = await fetch("/api/contact", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        name: form.get("name"),
        email: form.get("email"),
        phone: form.get("phone"),
        subject: form.get("subject"),
        message: form.get("message"),
      }),
    });
    setStatus(res.ok ? "sent" : "error");
    if (res.ok) (e.target as HTMLFormElement).reset();
  }

  return (
    <div className="max-w-2xl mx-auto px-4 py-8">
      <h2 className="text-zoo-green text-3xl font-bold mb-6">Contact Us</h2>

      {status === "sent" && (
        <p className="text-green-600 mb-4 font-semibold">Your message has been sent successfully.</p>
      )}
      {status === "error" && (
        <p className="text-red-500 mb-4">There was an error. Please try again.</p>
      )}

      <form onSubmit={handleSubmit} className="bg-white p-6 rounded shadow space-y-4">
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Name *</label>
          <input type="text" name="name" required className="w-full p-2 border rounded" />
        </div>
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Email *</label>
          <input type="email" name="email" required className="w-full p-2 border rounded" />
        </div>
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Phone</label>
          <input type="text" name="phone" className="w-full p-2 border rounded" />
        </div>
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Subject</label>
          <input type="text" name="subject" className="w-full p-2 border rounded" />
        </div>
        <div>
          <label className="block text-zoo-green font-semibold mb-1">Message *</label>
          <textarea name="message" rows={5} required className="w-full p-2 border rounded" />
        </div>
        <button
          type="submit"
          disabled={status === "sending"}
          className="bg-zoo-green text-white px-6 py-2 rounded hover:bg-zoo-green-hover disabled:opacity-50"
        >
          {status === "sending" ? "Sending..." : "Submit"}
        </button>
      </form>
    </div>
  );
}
