import { connectMongoDB } from "@/lib/mongodb";
import User from "@/models/user";
import NextAuth from "next-auth/next";
import GoogleProvider from "next-auth/providers/google";

// objeto de configuración de NextAuth
const authOptions = {
  providers: [
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
      //redirectUri: "http://hotlinemiamitecii.me/CloudComputing/",
    }),
  ],
  // función pasada como parametro (signIn()) a otra función
  callbacks: {
    async signIn({ user, account }) {
      // mensaje en consola con los datos del usuario y la cuenta
      console.log("User:", user);
      console.log("Account:", account);
      // verificar si la cuenta es de Google
      if (account.provider === "google") {
        // extraer el nombre y el email del usuario
        const { name, email, image } = user;
        try {
          // conectar a la base de datos MongoDB
          await connectMongoDB();

          // buscar si el usuario ya existe en la base de datos
          const userExists = await User.findOne({ email });

          // si el usuario no existe, se registra en la base de datos
          if (!userExists) {
            // realizar una petición POST a la API para registrar el usuario
            const res = await fetch("http://localhost:3000/api/user", {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
              },
              body: JSON.stringify({
                name,
                email,
                image,
              }),
            });

            if (res.ok) {
              console.log("User registered successfully:", { name, email, image });
              return user;
            }
          } else {
            console.log("User already exists:", { name, email, image });
          }
        } catch (error) {
          console.error("Error registering user:", error);
        }
      }

      return {
        user,
        url: "http://hotlinemiamitecii.me/CloudComputing/"
      };
    },
  },
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST};