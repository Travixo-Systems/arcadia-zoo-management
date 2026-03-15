"use client";

export default function ClickTracker({
  animalId,
  animalName,
  children,
}: {
  animalId: number;
  animalName: string;
  children: React.ReactNode;
}) {
  function handleClick() {
    fetch("/api/analytics", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ animalId, name: animalName }),
    }).catch(() => {});
  }

  return <div onClick={handleClick}>{children}</div>;
}
