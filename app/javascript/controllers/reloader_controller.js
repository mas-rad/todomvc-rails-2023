import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reload(event) {
    // event.preventDefault()
    event.stopImmediatePropagation()
    console.log("reloader")
    Turbo.visit(window.location.href)
  }
}
