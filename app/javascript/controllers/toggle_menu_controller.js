import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["new_movie_form", "menu_icon"]

  connect() {
  }

  toggle_form_menu() {
    const newMovieMenu = this.new_movie_formTarget;
    const menuIcon = this.menu_iconTarget;
    console.log(menuIcon)
    if (newMovieMenu.dataset.state == 'open') {
      newMovieMenu.style.width = "";
      newMovieMenu.dataset.state = "closed";
      menuIcon.className = "far fa-plus-square togglable-menu-icon";
    } else {
      newMovieMenu.style.width = "66%";
      newMovieMenu.dataset.state = "open"
      menuIcon.className = "far fa-minus-square togglable-menu-icon";
    }

  }
}
