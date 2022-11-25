import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["dogs", "map"]

  connect() {
  }

  switch(event) {
    event.preventDefault()
    this.dogsTarget.classList.toggle("d-none")
  }
}
