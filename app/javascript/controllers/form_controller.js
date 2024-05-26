import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
    add() {
        if ("content" in document.createElement("template")) {
          // select template
          const templateElement = document.querySelector('#template');
          // clone that template. Need to fill up node and 
          const nameDocFragment = templateElement.content.cloneNode(true);
          // select the extra div
          const extra = document.querySelector('#extra');
          // attach to the extra div
          extra.appendChild(nameDocFragment);
        }
        else {
            console.log('no dice');
        }
      }
    
    remove() {
        const extra = document.querySelector('#extra');
        // Remove only the last child from the node. 
        // extra is an object reference to an element
        const chillum = document.querySelector('#chillum');
        extra.removeChild(chillum);
        // while (extra.firstChild) {
        //   // The list is LIVE so it will re-index each call
        //   extra.removeChild(extra.secondChild);
        // }
    }
}
