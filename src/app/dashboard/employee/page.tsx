import { redirect } from "next/navigation";
import { requireAuth } from "@/lib/auth";
import DashboardCard from "@/components/DashboardCard";

export default async function EmployeeDashboard() {
  try { await requireAuth(["emp"]); } catch { redirect("/login"); }

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-zoo-green text-3xl font-bold mb-6">Employee Dashboard</h1>
      <div className="grid sm:grid-cols-2 gap-6">
        <DashboardCard title="Manage Reviews" description="View and moderate visitor reviews." href="/dashboard/admin/reviews" label="See Reviews" />
        <DashboardCard title="Manage Services" description="View zoo services." href="/dashboard/admin/services" label="Manage Services" />
        <DashboardCard title="Log Feeding" description="Add, edit, or delete animal feeding records." href="/dashboard/employee/feeding-logs" label="Manage Feeding" />
      </div>
    </div>
  );
}
