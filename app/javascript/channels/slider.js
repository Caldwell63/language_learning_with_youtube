(function() {

	function Slideshow( element ) {
		this.el = document.querySelector( element );
		this.init();
	}

	Slideshow.prototype = {
		init: function() {
			this.wrapper = this.el.querySelector( ".slider-wrapper" );
			this.slides = this.el.querySelectorAll( ".slide" );
			this.nav = this.el.querySelector( ".slider-nav" );
			this.index = 0;
			this.total = this.slides.length;

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

		actions: function() {
			let self = this;

			document.body.addEventListener( "keydown", function( e ) {
				let code = e.keyCode;

				if( code == 39 ) {
					self.next();
				}
				if( code == 37 ) {
					self.previous();
				}

			}, false);
		},

		next: function() {
			this.index++;

			if (this.index == this.total) this.index = 0;

			if( this.index == this.total -	 1 ) {
				this.index = this.total - 1;
			}
			this._slideTo( this.index );

		},

		previous: function() {
			this.index--;

			if (this.index < 0) this.index = this.total - 1;

			if( this.index == 0 ) {
				this.index = 0;
			}

			this._slideTo(this.index );

		}

	};

	document.addEventListener( "turbolinks:load", function() {

		const element = document.querySelector("#main-slider");

		if (element) {
			new Slideshow( "#main-slider" );
		}
	})


})();
