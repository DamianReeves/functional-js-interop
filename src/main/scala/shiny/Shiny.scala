package shiny

import scala.scalajs.js
import scala.scalajs.js.annotation.*


@JSExportTopLevel("Shiny")
object Shiny:

  @main
  def main(): Unit =
    println("Hello, world!, from Scala!")
  end main

  @JSExportTopLevel("MyClass")
  class MyClass:
    @JSExport
    def myMethod(): Unit =
      println("Hello, world!, from Scala!")
  end MyClass
end Shiny


