import { Inter } from "next/font/google";
import "./globals.css";
import Navbar from "@/components/Navbar";
import { NextAuthProvider } from "./Providers";

const inter = Inter({ subsets: ["latin"] });

export const metadata = {
  title: "Hotlinemiamitec2",
  description: "A WEB APP FOR HOTLINE MIAMI FANS",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <NextAuthProvider>
        <div className="max-w-3xl mx-auto">
          <Navbar />
          {children}
        </div>
        </NextAuthProvider>
      </body>
    </html>
  );
}
