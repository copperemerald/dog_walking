import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togleableElement"]
  // connect() {
  //   console.log("hello the toggle contreoller works")
  // }

  display() {
    // console.log(this.togleableElementTarget)
    this.togleableElementTarget.classList.toggle("d-none")
  }
}
