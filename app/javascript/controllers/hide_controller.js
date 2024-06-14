import { Controller } from "@hotwired/stimulus"

//* OK so this controller is for buttons to hide / unhide the reply form. To start the reply form and discard buttons are hidden. Then clicking reply unhides them and hides the reply button. The discard button then rehides the form and reply buttons. 

//! Is it the best way to do this? No! But just don't ask questions ok?

export default class extends Controller {
  static targets = ["reply", "button", "discardbutton"]

  hide() {
    this.replyTargets.forEach(element => {
        element.hidden = true
    });
    this.discardbuttonTargets.forEach(element => {
        element.hidden = true
    });
    this.buttonTargets.forEach(element => {
        element.hidden = false
    });
  }

  unhide() {
    this.replyTargets.forEach(element =>{
        element.hidden = false
    });
    this.buttonTargets.forEach(element => {
        element.hidden = true
    });
    this.discardbuttonTargets.forEach(element => {
        element.hidden = false
    });
  }
}