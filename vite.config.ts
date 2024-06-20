import { defineConfig } from 'vite'
import Inspect from 'vite-plugin-inspect';
import elmPlugin from 'vite-plugin-elm'
import gleam from "vite-gleam";
import scalaJSPlugin from "@scala-js/vite-plugin-scalajs";
import fable from "vite-plugin-fable";

export default defineConfig({
  plugins: [gleam(), elmPlugin(), fable(), scalaJSPlugin(), Inspect()],
  build: {sourcemap: true},
  // build: {
  //   rollupOptions: {
  //     input: {
  //       app: 'src/ffi_elm_interop.mjs'
  //     }
  //   }
  // }
});
