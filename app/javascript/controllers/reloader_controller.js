import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  reload(event) {
    Turbo.visit(window.location.href)
  }
}
