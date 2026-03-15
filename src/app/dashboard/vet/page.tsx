import { redirect } from "next/navigation";
import { requireAuth } from "@/lib/auth";
import DashboardCard from "@/components/DashboardCard";

export default async function VetDashboard() {
  try { await requireAuth(["vet"]); } catch { redirect("/login"); }

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-zoo-green text-3xl font-bold mb-6">Veterinarian Dashboard</h1>
      <div className="grid sm:grid-cols-2 gap-6">
        <DashboardCard title="Vet Reports" description="View, add, and edit veterinary reports." href="/dashboard/vet/vet-reports" label="Log Report" />
      </div>
    </div>
  );
}
