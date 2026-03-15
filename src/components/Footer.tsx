import Link from "next/link";

export default function Footer() {
  return (
    <footer className="bg-zoo-green-light text-white text-center py-4 mt-auto">
      <p>&copy; {new Date().getFullYear()} Zoo Arcadia. All rights reserved.</p>
      <p className="mt-1">
        <Link href="#" className="text-white hover:underline">Facebook</Link>{" | "}
        <Link href="#" className="text-white hover:underline">Twitter</Link>{" | "}
        <Link href="#" className="text-white hover:underline">Instagram</Link>
      </p>
      <p className="mt-1">
        <Link href="/contact" className="text-white hover:underline">Contact Us</Link>{" | "}
        <Link href="/about" className="text-white hover:underline">About Us</Link>
      </p>
    </footer>
  );
}
