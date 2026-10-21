import { NextResponse, type NextRequest } from "next/server";
import { markOwnerVisit } from "@/lib/analytics-exclude";

export function middleware(request: NextRequest) {
  return markOwnerVisit(request, NextResponse.next());
}

export const config = {
  // Pages only: skip build assets, Vercel internals, API routes and static files.
  matcher: ["/((?!api|_next/static|_next/image|_vercel|favicon.ico|.*\.(?:png|jpg|jpeg|gif|webp|avif|svg|ico|pdf|txt|xml|json|woff2?)$).*)"],
};
