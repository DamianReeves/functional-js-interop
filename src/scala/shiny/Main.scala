package shiny 

import org.scalajs.js
import org.scalajs.js.annotation.* 
import org.scalajs.dom

@main def main(): Unit =
  val p = dom.document.createElement("p")
  p.textContent = "Hello, world!"
  dom.document.body.appendChild(p)
  println("Hello, world!")