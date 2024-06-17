import { defineConfig } from "vite";
import dsv from "@rollup/plugin-dsv";
export default defineConfig({
  // 이미지 쓰기 위해서 고정
  publicDir: "./Main",
  plugins: [dsv()],
});
