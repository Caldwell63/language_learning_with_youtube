// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Stylesheets
import "../stylesheets/application.scss";
import "../channels/slider.js";
import "../channels/modal.js";
import { popup } from "../channels/popup.js";
// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import 'alpinejs';
import { each } from "jquery";

// Internal imports, e.g:
import { initSelect2 } from '../channels/init_select2';
import { searchYoutube } from '../channels/search';

document.addEventListener('turbolinks:load', () => {
  initSelect2();
  searchYoutube();

  const words = document.querySelectorAll('.word');
  words.forEach((word) => {
    word.addEventListener('click', (event) => {
      const text = word.textContent;
      console.log(text)
      const test = new SpeechSynthesisUtterance(text)
      const synth = window.speechSynthesis;
      test.lang = "en"
      synth.speak(test)
    });
  });
});
