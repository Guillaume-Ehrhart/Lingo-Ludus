import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    // subscribe to channel
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id :this.chatroomIdValue },
      { received: (data) => { this.#insertMessage(data) } }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  #buildMessageElement(currentUserIsSender, message) {

    return `
    <div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
      <div class="${this.#userStyleClass(currentUserIsSender)}">
        ${message}
      </div>
    </div>
  `
  }

  // add message
  #insertMessage(data) {
    console.log("Received data: ", data);

    const currentUserIsSender = this.currentUserIdValue === data.sender_id;
    if (!data) {
      console.error("Received data is undefined or empty.");
      return;
    }

    const messageElement = this.#buildMessageElement(currentUserIsSender, data);


    // Inserting the messageElement in the DOM
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

   // clears input field after message is sent
  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("disconnecting from the channel...")
    this.channel.unsubscribe()
  }
}
