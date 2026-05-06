import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  showModal(e) {
    e.preventDefault();
    const modal = document.getElementById("modal");
    modal.classList.remove("hidden");
  }

  toggleNavMenu() {
    this.navMenuTarget.classList.toggle("active");
  }
}
