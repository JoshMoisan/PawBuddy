import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-glass-card"
export default class extends Controller {
  static targets = ["card", "title", "dog-picture", "breed", "description", "doglink"]

  connect() {
    console.log("SHOW GLASS TARGET CONNECTED")
  }


  activate(event) {
    this.cardTarget.classList.add("active");

    const title = event.currentTarget.dataset.name;
    const description = event.currentTarget.dataset.description
    const breed = event.currentTarget.dataset.breed
    // const dog_image = event.currentTarget.dataset.dog_image
    const id = event.currentTarget.dataset.id

    console.log(id)

    this.titleTarget.innerHTML= `Hello, my name is <strong>${title}</strong>`;
    this.descriptionTarget.innerHTML= `${description}`;
    this.breedTarget.innerHTML=`Breed : ${breed}`;
    // this.dogImageTarget.src=`${dog_image}`;
    this.doglinkTarget.href= `dogs/${id}`
  }

  close() {
    this.cardTarget.classList.remove("active");
  }






}
