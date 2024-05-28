import { connectMongoDB } from "@/lib/mongodb";
import User from "@/models/user";
import { NextResponse } from "next/server";

export async function POST(request) {
  try {
    const { name, email, image } = await request.json();

    console.log("User Data:", { name, email, image });

    await connectMongoDB();

    await User.create({ name, email, image });

    console.log("User Registered:", { name, email, image });

    return NextResponse.json({ message: "User Registered" }, { status: 201 });
    
  } catch (error) {
    console.error("Error registering user:", error);
    return NextResponse.error(new Error("Failed to register user"), {
      status: 500,
    });
  }
}
