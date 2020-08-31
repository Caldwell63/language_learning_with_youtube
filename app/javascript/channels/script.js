
document.addEventListener('DOMContentLoaded', () => {
    'use strict';

    document.addEventListener('keydown', event => {
      const key = event.key.toLowerCase();
      const next = document.querySelector('.next');
      console.log(next);
      console.log(key);
    });
});
//
//
// document.onkeyup = function(e) {
//     var image = document.getElementById('x');
//
//     //Left Key
//     if (event.keyCode == 37) {
//         previous();
//         //Right Key
//     } else if (event.keyCode == 39) {
//         next();
//     }
// }
