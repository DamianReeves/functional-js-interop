import {Elm} from './elm/Main.elm'

export function initElm(jobName:String) {
  const worker = Elm.Main.init({
    flags: jobName
  });

  console.log("Elm worker", worker);


  return worker;
}

export function sendSourceFileUpdate(worker:any, path:String, contents:String) {
  console.log("Sending source file update", path, contents);
  worker.ports.sourceFileUpdate.send([path, contents]);
}

export function subscribe_to_output(worker:any, callback:Function) {
  const outer_callback = (msg:any) => {    
    console.log("Got message from Elm", msg);
    if(Array.isArray(msg)){
      console.log("Message is an array", msg);
    }
    callback(msg);
  };
  worker.ports.output.subscribe(outer_callback);
}