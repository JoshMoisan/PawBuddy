import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-glass-card"
export default class extends Controller {
  static targets = ["card", "title", "dog-picture", "breed", "description"]

  connect() {
    console.log("SHOW GLASS TARGET CONNECTED")
  }


  activate(event) {
    this.cardTarget.classList.add("active");

    const title = event.currentTarget.dataset.name;
    const description = event.currentTarget.dataset.description
    const breed = event.currentTarget.dataset.breed
    const dog_image = event.currentTarget.dataset.dog_image



    // this.title.innerHTML = "";
    // this.description.innerHTML = "";
    // this.breed.innerHTML = "";
    // this.dog_image.innertHTML = "";


    this.titleTarget.insertAdjacentHTML("beforeend", `Hello, my name is <strong>${title}</strong>`);
    this.descriptionTarget.insertAdjacentHTML("beforeend", `${description}`);
    this.breedTarget.insertAdjacentHTML("beforeend", `Breed : ${breed}`);
    this.dog_imageTarget.insertAdjacentHTML("beforeend", `${dog_image}`);
  }

  close() {
    this.cardTarget.classList.remove("active");
  }






}
