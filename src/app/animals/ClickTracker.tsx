"use client";

import Link from "next/link";

export default function ClickTracker({
  animalId,
  animalName,
  href,
  className,
  children,
}: {
  animalId: number;
  animalName: string;
  href: string;
  className?: string;
  children: React.ReactNode;
}) {
  function handleClick() {
    fetch("/api/analytics", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ animalId, name: animalName }),
    }).catch(() => {});
  }

  return (
    <Link href={href} onClick={handleClick} className={className}>
      {children}
    </Link>
  );
}
