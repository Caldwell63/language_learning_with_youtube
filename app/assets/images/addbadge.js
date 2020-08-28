
chrome.browserAction.onClicked.addListener((tab) => {
  chrome.tabs.executeScript({
    code: 'document.body.style.backgroundColor="#C3413B"'
           // 'document.body.style.backgroundColor="#C1987B"'


    // const list = document.querySelector('ytd-video-primary-info-renderer h1');
  });
});

console.log("Hello")


//
// console.log(d1);
// d1.insertAdjacentHTML('afterend', '<div id="two">two</div>');
