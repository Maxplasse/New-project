import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["List all your favorite moovies", "About a 1000 moovies in our library!"],
      typeSpeed: 30,
      loop: true
    });
  }
}
