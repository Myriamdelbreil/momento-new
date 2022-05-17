import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "button1", "button2"]

  connect() {
    console.log(this.contentTarget)
  }
  revealContent() {
    this.contentTarget.classList.remove("d-none")
    this.button1Target.classList.add("d-none")
    this.button2Target.classList.remove("d-none")
  }

  hideContent(){
    this.contentTarget.classList.add("d-none")
    this.button1Target.classList.remove("d-none")
    this.button2Target.classList.add("d-none")
  }
}
