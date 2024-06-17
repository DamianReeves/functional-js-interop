import { defineConfig } from 'vite'
import Inspect from 'vite-plugin-inspect';
import elmPlugin from 'vite-plugin-elm'
import gleam from "vite-gleam";
import scalaJSPlugin from "@scala-js/vite-plugin-scalajs";

export default defineConfig({
  plugins: [gleam(), elmPlugin(), scalaJSPlugin(), Inspect()],
  build: {sourcemap: true},
  // build: {
  //   rollupOptions: {
  //     input: {
  //       app: 'src/ffi_elm_interop.mjs'
  //     }
  //   }
  // }
});
