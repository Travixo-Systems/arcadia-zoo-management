import Link from "next/link";

const explore = [
  { href: "/animals", label: "Habitats" },
  { href: "/services", label: "Services" },
  { href: "/bookings", label: "Reservations" },
];

const company = [
  { href: "/about", label: "About Us" },
  { href: "/contact", label: "Contact" },
  { href: "/login", label: "Staff Login" },
];

const socials = [
  { href: "#", label: "Facebook", icon: "M13.5 9H15V6.5h-1.5c-1.7 0-2.5 1-2.5 2.6V11H9v2.5h2v6h2.5v-6H15l.5-2.5h-2V9.3c0-.2.1-.3.3-.3z" },
  { href: "#", label: "Twitter", icon: "M21 5.9c-.7.3-1.4.5-2.2.6.8-.5 1.4-1.2 1.7-2.1-.8.5-1.6.8-2.5 1a3.8 3.8 0 0 0-6.5 3.5A10.8 10.8 0 0 1 3.9 4.7a3.8 3.8 0 0 0 1.2 5.1c-.6 0-1.2-.2-1.7-.5a3.8 3.8 0 0 0 3 3.8c-.5.2-1.1.2-1.7.1a3.8 3.8 0 0 0 3.6 2.7A7.7 7.7 0 0 1 3 17.5 10.9 10.9 0 0 0 18.7 8.3c.7-.5 1.4-1.2 1.9-2z" },
  { href: "#", label: "Instagram", icon: "M12 8.5a3.5 3.5 0 1 0 0 7 3.5 3.5 0 0 0 0-7zm0 5.8a2.3 2.3 0 1 1 0-4.6 2.3 2.3 0 0 1 0 4.6zM16 4H8a4 4 0 0 0-4 4v8a4 4 0 0 0 4 4h8a4 4 0 0 0 4-4V8a4 4 0 0 0-4-4zm2.8 12a2.8 2.8 0 0 1-2.8 2.8H8A2.8 2.8 0 0 1 5.2 16V8A2.8 2.8 0 0 1 8 5.2h8A2.8 2.8 0 0 1 18.8 8v8zm-2.3-8.4a.9.9 0 1 0 0 1.8.9.9 0 0 0 0-1.8z" },
];

export default function Footer() {
  return (
    <footer className="mt-auto bg-zoo-green-light text-white">
      <div className="max-w-6xl mx-auto px-6 py-10 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-8">
        {/* Brand */}
        <div className="sm:col-span-2 md:col-span-1">
          <div className="flex items-center gap-2">
            <img src="/images/ide-verte.png" alt="Zoo Arcadia" className="h-9 bg-white/90 rounded p-1" />
            <span className="font-bold text-lg">Zoo Arcadia</span>
          </div>
          <p className="mt-3 text-sm text-white/80 leading-relaxed">
            A living world of wildlife across eight immersive habitats. Discover, learn, and reconnect with nature.
          </p>
        </div>

        {/* Explore */}
        <div>
          <h4 className="font-semibold text-sm uppercase tracking-wide text-white/70 mb-3">Explore</h4>
          <ul className="space-y-2">
            {explore.map((l) => (
              <li key={l.href}>
                <Link href={l.href} className="text-sm text-white/90 hover:text-white hover:underline">
                  {l.label}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Company */}
        <div>
          <h4 className="font-semibold text-sm uppercase tracking-wide text-white/70 mb-3">Company</h4>
          <ul className="space-y-2">
            {company.map((l) => (
              <li key={l.href}>
                <Link href={l.href} className="text-sm text-white/90 hover:text-white hover:underline">
                  {l.label}
                </Link>
              </li>
            ))}
          </ul>
        </div>

        {/* Social */}
        <div>
          <h4 className="font-semibold text-sm uppercase tracking-wide text-white/70 mb-3">Follow Us</h4>
          <div className="flex gap-3">
            {socials.map((s) => (
              <a
                key={s.label}
                href={s.href}
                aria-label={s.label}
                className="flex h-9 w-9 items-center justify-center rounded-full bg-white/10 hover:bg-white/25 transition-colors"
              >
                <svg viewBox="0 0 24 24" fill="currentColor" className="h-5 w-5">
                  <path d={s.icon} />
                </svg>
              </a>
            ))}
          </div>
        </div>
      </div>

      <div className="border-t border-white/20">
        <p className="max-w-6xl mx-auto px-6 py-4 text-center text-sm text-white/70">
          &copy; {new Date().getFullYear()} Zoo Arcadia. All rights reserved.
        </p>
      </div>
    </footer>
  );
}
