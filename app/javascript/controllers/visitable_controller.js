import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    url: String
  }

  visit(event) {
    Turbo.visit(this.urlValue, { acceptsStreamResponse: true })
  }
}
