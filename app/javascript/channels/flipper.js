var card = document.getElementById('card');

card.addEventListener('click', function() {
	if (!this.classList.contains('on')) {
		this.classList.remove('off');
		this.classList.add('on');
	} else {
		this.classList.remove('on');
		this.classList.add('off');
	}
});
