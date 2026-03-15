import type { Metadata } from "next";
import "./globals.css";
import Header from "@/components/Header";
import Footer from "@/components/Footer";
import { getSession } from "@/lib/auth";

export const metadata: Metadata = {
  title: "Zoo Arcadia",
  description: "Arcadia Zoo Management System",
};

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const user = await getSession();
  return (
    <html lang="en">
      <body className="flex flex-col min-h-screen bg-zoo-cream">
        <Header user={user} />
        <main className="flex-1">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
