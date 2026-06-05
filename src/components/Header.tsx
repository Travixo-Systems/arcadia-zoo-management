"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { useState } from "react";
import type { SessionUser } from "@/types";

const dashboardPaths: Record<string, string> = {
  admin: "/dashboard/admin",
  vet: "/dashboard/vet",
  emp: "/dashboard/employee",
};

const navLinks = [
  { href: "/services", label: "Services" },
  { href: "/animals", label: "Habitats" },
  { href: "/bookings", label: "Reservations" },
  { href: "/contact", label: "Contact" },
];

export default function Header({ user }: { user: SessionUser | null }) {
  const [menuOpen, setMenuOpen] = useState(false);
  const pathname = usePathname();

  const isActive = (href: string) =>
    pathname === href || pathname.startsWith(href + "/");

  const navLinkClass = (href: string) =>
    `relative px-3 py-2 rounded text-sm md:text-base transition-colors ${
      isActive(href)
        ? "text-zoo-green font-semibold"
        : "text-gray-700 hover:text-zoo-green hover:bg-zoo-bg"
    }`;

  return (
    <header className="sticky top-0 z-30 bg-white/95 backdrop-blur border-b-2 border-zoo-green px-5 md:px-10 py-3 flex justify-between items-center">
      <Link href="/" className="flex items-center gap-2 shrink-0">
        <img src="/images/ide-verte.png" alt="Zoo Logo" className="h-10" />
        <span className="text-zoo-green font-bold text-xl hidden sm:inline">
          Zoo Arcadia
        </span>
      </Link>

      {/* Desktop nav */}
      <nav className="hidden md:flex items-center gap-1">
        {navLinks.map((l) => (
          <Link key={l.href} href={l.href} className={navLinkClass(l.href)}>
            {l.label}
            {isActive(l.href) && (
              <span className="absolute left-3 right-3 -bottom-0.5 h-0.5 rounded bg-zoo-green" />
            )}
          </Link>
        ))}
        <div className="border-l border-gray-300 h-6 mx-2" />
        {user ? (
          <>
            <Link
              href={dashboardPaths[user.role] || "/dashboard/admin"}
              className="px-3 py-2 font-bold text-sm md:text-base text-zoo-green hover:text-zoo-green-hover transition-colors"
            >
              Dashboard
            </Link>
            <form action="/api/auth/logout" method="POST">
              <button
                type="submit"
                className="bg-zoo-green hover:bg-zoo-green-hover text-white px-4 py-2 rounded text-sm transition-colors"
              >
                Logout
              </button>
            </form>
          </>
        ) : (
          <Link
            href="/login"
            className="bg-zoo-green hover:bg-zoo-green-hover text-white px-4 py-2 rounded text-sm transition-colors"
          >
            Login
          </Link>
        )}
      </nav>

      {/* Mobile hamburger / X */}
      <button
        className="md:hidden relative w-7 h-7 flex flex-col justify-center items-center"
        onClick={() => setMenuOpen((o) => !o)}
        aria-label="Toggle menu"
        aria-expanded={menuOpen}
      >
        <span
          className={`block w-6 h-0.5 bg-gray-800 transition-all duration-300 ${
            menuOpen ? "rotate-45 translate-y-[3px]" : "-translate-y-1"
          }`}
        />
        <span
          className={`block w-6 h-0.5 bg-gray-800 transition-all duration-300 ${
            menuOpen ? "opacity-0" : "opacity-100"
          }`}
        />
        <span
          className={`block w-6 h-0.5 bg-gray-800 transition-all duration-300 ${
            menuOpen ? "-rotate-45 -translate-y-[3px]" : "translate-y-1"
          }`}
        />
      </button>

      {/* Mobile dropdown */}
      <div
        className={`md:hidden absolute top-full left-0 right-0 bg-white border-b border-gray-200 shadow-lg overflow-hidden transition-[max-height,opacity] duration-300 ease-in-out ${
          menuOpen ? "max-h-96 opacity-100" : "max-h-0 opacity-0"
        }`}
      >
        <nav className="flex flex-col p-3 gap-1">
          {navLinks.map((l) => (
            <Link
              key={l.href}
              href={l.href}
              onClick={() => setMenuOpen(false)}
              className={`px-3 py-2.5 rounded text-base transition-colors ${
                isActive(l.href)
                  ? "bg-zoo-bg text-zoo-green font-semibold border-l-4 border-zoo-green"
                  : "text-gray-700 hover:bg-zoo-bg"
              }`}
            >
              {l.label}
            </Link>
          ))}
          <div className="border-t border-gray-200 my-1" />
          {user ? (
            <>
              <Link
                href={dashboardPaths[user.role] || "/dashboard/admin"}
                onClick={() => setMenuOpen(false)}
                className="px-3 py-2.5 rounded text-base font-bold text-zoo-green hover:bg-zoo-bg"
              >
                Dashboard
              </Link>
              <form action="/api/auth/logout" method="POST" className="px-3 pt-1">
                <button
                  type="submit"
                  className="w-full bg-zoo-green hover:bg-zoo-green-hover text-white px-4 py-2.5 rounded text-sm transition-colors"
                >
                  Logout
                </button>
              </form>
            </>
          ) : (
            <Link
              href="/login"
              onClick={() => setMenuOpen(false)}
              className="mx-3 mt-1 text-center bg-zoo-green hover:bg-zoo-green-hover text-white px-4 py-2.5 rounded text-sm transition-colors"
            >
              Login
            </Link>
          )}
        </nav>
      </div>
    </header>
  );
}
