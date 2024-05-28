"use client";

import UserInfo from "@/components/UserInfo";
import Image from "next/image";

export default function Home() {

  const handleButtonClick = async () => {
    window.location.href = "/index.html";
  };

  return (
    <div className="grid place-items-center h-screen -mt-24">
      <UserInfo />
      <button
        onClick={handleButtonClick}
        className="mt-5 px-6 py-3 bg-pink-500 text-white font-semibold rounded-lg shadow-md hover:bg-pink-600 focus:outline-none focus:ring-2 focus:ring-pink-400 focus:ring-opacity-75 transition duration-300 ease-in-out transform hover:scale-105"
      >
        Juego HotlineMiamiTecII
      </button>
    </div>
  );
}
