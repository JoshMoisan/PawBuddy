import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-glass-card"
export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log("SHOW GLASS TARGET CONNECTED")
  }


  activate(event) {
    this.cardTarget.classList.add("active");
    // event.currentTarget.dataset.name
    // event.currentTarget.dataset.description
    // event.currentTarget.dataset.breed
    // event.currentTarget.dataset.dog_image



    const list = 

    // card-Target -> Title
    list.insertAdjacentHTML("beforeend", "Hello, my name is #{dataset.name}");

    // card-Target -> description
    list.insertAdjacentHTML("beforeend", "{dataset.description}");

    // card-Target -> breed
    list.insertAdjacentHTML("beforeend", "{dataset.breed}");

    // card-Target -> dog-picture
    list.insertAdjacentHTML("beforeend", "{dataset.dog_image}");
  }

  close() {
    this.cardTarget.classList.remove("active");
  }






}
