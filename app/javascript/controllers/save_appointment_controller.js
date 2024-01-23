import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

// Connects to data-controller="save-appointment"
export default class extends Controller {
  connect() {
    console.log('Save-Appointment Controller Connected')
  }

  initialize() {
     this.element.setAttribute('data-action', "click->save-appointment#showModal");
  }

  showModal(event){
    console.log('showModal triggered')
    event.preventDefault()

    this.url = this.element.getAttribute('href')
    console.log('Fetched URL:', this.url);
    fetch(this.url, {
      headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
    .then(response => {
      response.text()
      console.log('Fetch response received');
    })


    .then(html => {
      console.log('HTML response', html);
      Turbo.renderStreamMessage(html)
    })
    .catch(error => console.error('Error:', error));
  }
}
