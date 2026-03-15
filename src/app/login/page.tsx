"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";

export default function LoginPage() {
  const router = useRouter();
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setLoading(true);
    setError("");
    const form = new FormData(e.currentTarget);
    const res = await fetch("/api/auth/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        username: form.get("username"),
        password: form.get("password"),
      }),
    });
    const data = await res.json();
    if (!res.ok) {
      setError(data.error || "Login failed");
      setLoading(false);
      return;
    }
    router.push(data.redirect);
    router.refresh();
  }

  return (
    <div className="max-w-md mx-auto mt-24 p-6 bg-white rounded shadow">
      <h2 className="text-2xl font-bold text-center mb-6">Login</h2>
      {error && <p className="text-red-500 text-center mb-4">{error}</p>}
      <form onSubmit={handleSubmit}>
        <label className="block font-semibold text-gray-600 mb-1">Username</label>
        <input
          type="text"
          name="username"
          required
          className="w-full p-2 border rounded mb-4"
        />
        <label className="block font-semibold text-gray-600 mb-1">Password</label>
        <input
          type="password"
          name="password"
          required
          className="w-full p-2 border rounded mb-4"
        />
        <button
          type="submit"
          disabled={loading}
          className="w-full bg-green-600 text-white py-2 rounded hover:bg-green-700 disabled:opacity-50"
        >
          {loading ? "Logging in..." : "Login"}
        </button>
      </form>
    </div>
  );
}
