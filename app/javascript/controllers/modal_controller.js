import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  close(e) {
    // Only close if clicking overlay or close button
    if (
      e.target === this.element ||
      e.target.classList.contains("modal-close")
    ) {
      this.element.classList.add("hidden");
    }
  }
}
