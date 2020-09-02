(function() {

	function Slideshow( element ) {
		this.el = document.querySelector( element );
		this.init();
	}

	Slideshow.prototype = {
		init: function() {
			this.wrapper = this.el.querySelector( ".slider-wrapper" );
			this.slides = this.el.querySelectorAll( ".slide" );
			this.previous = this.el.querySelector( ".slider-previous" );
			this.next = this.el.querySelector( ".slider-next" );
			this.nav = this.el.querySelector( ".slider-nav" );
			this.index = 0;
			this.total = this.slides.length;

			this.setup();
			this.actions();
		},
		_slideTo: function( slide ) {
			let currentSlide = this.slides[slide];
			currentSlide.style.opacity = 1;
			currentSlide.style.zIndex = 2;

			for( let i = 0; i < this.slides.length; i++ ) {
				let slide = this.slides[i];
				if( slide !== currentSlide ) {
					slide.style.opacity = 0;
					slide.style.zIndex = 1;
				}
			}
		},
		setup: function() {
			let slides = this.slides,
				len = slides.length,
				i;
			for( i = 0; i < len; ++i ) {
				let slide = slides[i],
					src = slide.getAttribute( "data-image" );
			    slide.style.backgroundImage = "url(" + src + ")";
			}
		},
		actions: function() {
			let self = this;

			self.el.addEventListener( "mouseover", function() {
				self.nav.style.display = "block";

			}, false);

			self.el.addEventListener( "mouseout", function() {
				self.nav.style.display = "none";

			}, false);

			self.next.addEventListener( "click", function() {
				self.index++;

				if (self.index == self.total) self.index = 0;

				if( self.index == self.total -	 1 ) {
					self.index = self.total - 1;
				}
				self._slideTo( self.index );

			}, false);

			self.previous.addEventListener( "click", function() {
				self.index--;

				if (self.index < 0) self.index = self.total - 1;

				if( self.index == 0 ) {
					self.index = 0;
					self.previous.style.display = "none";
				}

				self._slideTo(self.index );

			}, false);

			document.body.addEventListener( "keydown", function( e ) {
				let code = e.keyCode;
				let evt = new Event( "click" );

				if( code == 39 ) {
					self.next.dispatchEvent( evt );
				}
				if( code == 37 ) {
					self.previous.dispatchEvent( evt );
				}

			}, false);
		}


	};

	document.addEventListener( "DOMContentLoaded", function() {

		const element = document.querySelector("#main-slider");

		if (element) {
			new Slideshow( "#main-slider" );
		}
	});


})();
