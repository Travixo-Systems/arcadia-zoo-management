"use client";

import Link from "next/link";
import { useState } from "react";
import type { SessionUser } from "@/types";

const dashboardPaths: Record<string, string> = {
  admin: "/dashboard/admin",
  vet: "/dashboard/vet",
  emp: "/dashboard/employee",
};

export default function Header({ user }: { user: SessionUser | null }) {
  const [menuOpen, setMenuOpen] = useState(false);

  return (
    <header className="bg-white border-b-2 border-zoo-green px-5 md:px-10 py-3 flex justify-between items-center relative">
      <Link href="/" className="flex items-center gap-2">
        <img src="/images/ide-verte.png" alt="Zoo Logo" className="h-10" />
        <span className="text-zoo-green font-bold text-xl hidden sm:inline">
          Zoo Arcadia
        </span>
      </Link>

      <nav
        className={`${
          menuOpen ? "flex" : "hidden"
        } md:flex flex-col md:flex-row absolute md:relative top-16 md:top-0 right-0 bg-white md:bg-transparent w-1/2 md:w-auto z-10 items-start md:items-center gap-1`}
      >
        <Link href="/services" className="px-3 py-2 hover:bg-zoo-bg rounded text-sm md:text-base">
          Services
        </Link>
        <Link href="/animals" className="px-3 py-2 hover:bg-zoo-bg rounded text-sm md:text-base">
          Habitats
        </Link>
        <Link href="/bookings" className="px-3 py-2 hover:bg-zoo-bg rounded text-sm md:text-base">
          Reservations
        </Link>
        <Link href="/contact" className="px-3 py-2 hover:bg-zoo-bg rounded text-sm md:text-base">
          Contact
        </Link>
        <div className="hidden md:block border-l border-gray-300 h-6 mx-2" />
        {user ? (
          <>
            <Link
              href={dashboardPaths[user.role] || "/dashboard/admin"}
              className="px-3 py-2 font-bold text-sm md:text-base"
            >
              Dashboard
            </Link>
            <form action="/api/auth/logout" method="POST">
              <button
                type="submit"
                className="bg-zoo-green text-white px-4 py-2 rounded text-sm"
              >
                Logout
              </button>
            </form>
          </>
        ) : (
          <Link
            href="/login"
            className="bg-zoo-green text-white px-4 py-2 rounded text-sm"
          >
            Login
          </Link>
        )}
      </nav>

      <button
        className="md:hidden flex flex-col gap-1.5"
        onClick={() => setMenuOpen(!menuOpen)}
        aria-label="Toggle menu"
      >
        <span className="block w-6 h-0.5 bg-gray-800" />
        <span className="block w-6 h-0.5 bg-gray-800" />
        <span className="block w-6 h-0.5 bg-gray-800" />
      </button>
    </header>
  );
}
