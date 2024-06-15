import gleam/dynamic
import gleam/io
import gleam/javascript/array.{type Array}
import gleam/list
import gleam/string.{inspect}

pub fn main() {
  let worker = init_elm("shiny")
  send_source_file_update(worker, "shiny/Main.elm", "module Main exposing (..)")
  send_source_file_update(worker, "shiny/Test.elm", "module Main exposing (..)")
  send_source_file_update(
    worker,
    "shiny/Other.elm",
    "module Main exposing (..)",
  )
  subscribe_to_output(worker, on_output)
  io.println("Hello from shiny!!!!")
}

pub fn on_output(output: Array(OutputMessage)) {
  let print_output = fn(msg: OutputMessage) {
    io.debug("Received Msg: " <> inspect(msg))
  }
  let msgs = array.to_list(output)
  msgs
  |> list.each(print_output)
  Nil
}

@external(javascript, "./ffi_main.ts", "initElm")
fn init_elm(job_name: String) -> ElmWorker

@external(javascript, "./ffi_main.ts", "sendSourceFileUpdate")
pub fn send_source_file_update(
  worker: ElmWorker,
  source_file: String,
  source_file_content: String,
) -> Nil

@external(javascript, "./ffi_main.ts", "subscribe_to_output")
pub fn subscribe_to_output(
  worker: ElmWorker,
  callback: fn(Array(OutputMessage)) -> Nil,
) -> Nil

pub type ElmWorker

pub type OutputMessage =
  dynamic.Dynamic
