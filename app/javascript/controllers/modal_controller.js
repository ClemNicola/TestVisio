import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["myModal"]

  connect() {
    this.modal = new bootstrap.Modal(this.myModalTarget, {
      keyboard: false
    })

  }
  
  open(){
    this.modal.show()
  }

  disconnect(){
    this.modal.hide()
  }

  submitEnd(){
    this.modal.hide()
  }
}
