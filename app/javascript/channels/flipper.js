const flipper = () => {

  var cards = document.querySelectorAll('.flipper')
  if (!cards) return

  document.querySelector('#btn-next').addEventListener('click', function(e) {
    cards.forEach(function(card) {
      card.style.display = card.style.display == 'none' ? 'block' : 'none'
    })
  })

  cards.forEach(function(card) {
    card.addEventListener('click', function() {
      if (!this.classList.contains('on')) {
        this.classList.remove('off');
        this.classList.add('on');
      } else {
        this.classList.remove('on');
        this.classList.add('off');
      }
    });
  })
};

export { flipper };
