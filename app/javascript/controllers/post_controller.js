import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.likeCount = 0
  }

  like(e) {
    e.preventDefault()
    this.likeCount++
    const button = e.target
    button.classList.add("liked")
    button.textContent = `❤️ ${this.likeCount}`
    
    // Reset after animation
    setTimeout(() => {
      button.classList.remove("liked")
    }, 300)
  }
}
