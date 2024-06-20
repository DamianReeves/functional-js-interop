import {main} from './shiny.gleam';
import {Shiny, MyClass} from 'scalajs:main.js'
import {addFromFSharp} from './fsharp/Program.fs';

console.log("addFromFSharp", addFromFSharp);

const myClass = MyClass();
main();
console.log("Shiny", Shiny);
console.log("MyClass", MyClass, myClass, myClass.myMethod)
myClass.myMethod();
console.log("Hello from Gleam!");
