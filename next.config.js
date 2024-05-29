/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  output: 'standalone',
  //output: "export",
  images: {
    domains: ["lh3.googleusercontent.com"],
  },
};

module.exports = nextConfig;