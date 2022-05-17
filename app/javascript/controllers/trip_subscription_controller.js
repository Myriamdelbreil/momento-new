import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = {
    tripId: Number,
    currentUserId: Number
  }
  static targets = ["messages", "form", "message", "notif"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "TripChannel", id: this.tripIdValue },
      { received: data => this.insertMessageScrollDownAndResetForm(data)}),
      console.log(`Subscribe to the chatroom with the id ${this.tripIdValue}.`)
  }

  insertMessageScrollDownAndResetForm(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data.message_html);
    // if (this.currentUserIdValue != data.auhtor_id) this.messageTargets[this.messageTargets.length - 1].classList.remove('my-message');
    console.log("Insertion2 ok")
    console.log(this.messagesTarget.scrollHeight)
    this.messagesTarget.scrollTo(0, this.messageTarget.scrollHeight);
    console.log("Insertion3 ok")
    this.formTarget.reset();

    // this.notifTarget.classList.remove("d-none");
  }
}
