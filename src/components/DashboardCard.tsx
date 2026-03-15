import Link from "next/link";

interface DashboardCardProps {
  title: string;
  description: string;
  href: string;
  label: string;
}

export default function DashboardCard({ title, description, href, label }: DashboardCardProps) {
  return (
    <section className="bg-white rounded p-5 shadow hover:shadow-lg hover:-translate-y-1 transition-all">
      <h2 className="text-zoo-green text-xl font-bold mb-2">{title}</h2>
      <p className="text-gray-600 mb-4">{description}</p>
      <Link href={href} className="bg-zoo-green text-white px-4 py-2 rounded hover:bg-zoo-green-hover transition">
        {label}
      </Link>
    </section>
  );
}
