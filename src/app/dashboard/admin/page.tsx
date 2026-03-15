import { redirect } from "next/navigation";
import { requireAuth } from "@/lib/auth";
import DashboardCard from "@/components/DashboardCard";

export default async function AdminDashboard() {
  try { await requireAuth(["admin"]); } catch { redirect("/login"); }

  return (
    <div className="max-w-3xl mx-auto px-4 py-8">
      <h1 className="text-zoo-green text-3xl font-bold mb-6">Admin Dashboard</h1>
      <div className="grid sm:grid-cols-2 gap-6">
        <DashboardCard title="Manage Users" description="View, add, edit, or delete user accounts." href="/dashboard/admin/users" label="Manage Users" />
        <DashboardCard title="Manage Services" description="View, add, edit, or delete zoo services." href="/dashboard/admin/services" label="Manage Services" />
        <DashboardCard title="Manage Animals" description="View, add, edit, or delete animal records." href="/dashboard/admin/animals" label="Manage Animals" />
        <DashboardCard title="Manage Reviews" description="Approve or reject visitor reviews." href="/dashboard/admin/reviews" label="Manage Reviews" />
        <DashboardCard title="Vet Reports" description="Access and manage veterinary reports." href="/dashboard/admin/vet-reports" label="View Reports" />
        <DashboardCard title="Analytics" description="View animal popularity statistics." href="/dashboard/admin/analytics" label="View Analytics" />
      </div>
    </div>
  );
}
