import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "button1", "button2", "accomodationsMap"]

  revealContent() {
    this.contentTarget.classList.remove("d-none")
    this.button1Target.all.classList.add("d-none")
    this.button2Target.all.classList.remove("d-none")
    this.accomodationsMapTarget.classList.add("d-none")
  }

  hideContent(){
    this.contentTarget.classList.add("d-none")
    this.button1Target.all.classList.remove("d-none")
    this.button2Target.all.classList.add("d-none")
    this.accomodationsMapTarget.classList.remove("d-none")
  }
}
