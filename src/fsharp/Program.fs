﻿module Program

open System

let addFromFSharp x y = x + y

[<EntryPoint>]
let main argv =
    printfn "Hello World from F#!"
    0 // return an integer exit code
