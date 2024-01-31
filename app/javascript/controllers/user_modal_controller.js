import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-modal"
export default class extends Controller {
  connect() {
    console.log('Im conencted')
  }

  initialize(){
    this.element.setAttribute("data-action", "click->user-modal#showModal")
  }

  showModal(e){
    e.preventDefault();
    this.url = this.element.getAttribute('href')
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html))
  }
}
