const searchYoutube = () => {
  const button = document.querySelector('#search-button');
  const input = document.querySelector('#youtube-query');
  const results = document.querySelector('#youtube-results');
  console.log(button)
  if (button) {
    button.addEventListener('click', (ev) => {
      console.log('fdsfsd');
      ev.preventDefault();

      const url = `/search?youtube-query=${input.value}`
      fetch(url)
        .then(response => response.text())
        .then(data => {
          results.innerHTML = data;
        })
    });
  }
}

export { searchYoutube }
