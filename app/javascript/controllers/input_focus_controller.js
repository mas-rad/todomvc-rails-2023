import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // Focus on input
    this.element.focus()
    // Move cursor to end of input
    this.element.setSelectionRange(
      this.element.value.length,
      this.element.value.length
    )
  }
}
