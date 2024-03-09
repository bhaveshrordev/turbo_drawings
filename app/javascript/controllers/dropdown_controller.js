import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  
  static targets = ["dropdownContent", "openButton", "closeButton"]

  connect() {
    this.closeDropdown()
  }

  toggleDropdown() {
    if (this.dropdownContentTarget.hidden == true) {
      this.openDropdown()
    }
    else {
      this.closeDropdown()
    }
  }

  openDropdown() {
    this.dropdownContentTarget.hidden = false
    try {
      this.closeButtonTarget.hidden = false
      this.openButtonTarget.hidden = true
    } catch {}
  }

  closeDropdown() {
    this.dropdownContentTarget.hidden = true
    try {
      this.openButtonTarget.hidden = false
      this.closeButtonTarget.hidden = true
    } catch {}
  }
}
