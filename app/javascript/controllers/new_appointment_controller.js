import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-appointment"
export default class extends Controller {
  connect() {
    console.log('Im connected')
  }

  initialize(){
    this.element.setAttribute("data-action", "click->new-appointment  #showModal")
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
