// if ('speechSynthesis' in window) {
    // Speech Synthesis supported 🎉
//    }else{
     // Speech Synthesis Not Supported 😣
//      alert("Sorry, your browser doesn't support text to speech!");
//    }

const msg = new SpeechSynthesisUtterance();
const voices = window.speechSynthesis.getVoices();
msg.voice = voices[10]; 
msg.volume = 1; // From 0 to 1
msg.rate = 1; // From 0.1 to 10
msg.pitch = 2; // From 0 to 2
msg.text = "word";
msg.lang = 'en';
speechSynthesis.speak(msg);

const msg = new SpeechSynthesisUtterance();
file_data = File.read("cards.html.erb")

const volume = document.querySelector("")

addEventListener
// file = File.open("cards.html.erb")
// msg.text = `${}`;
// function speech {
//   let word;
//   if msg === (/"(.*?)"/)
// }
window.speechSynthesis.speak(msg);

window.speechSynthesis.speak(msg);


speechSynthesis.getVoices().forEach(function(voice) {
    console.log(voice.name, voice.default ? voice.default :'');
  });

const button = document.getElementById("button");
button.addEventListener("click", function(event){
   alert(event.target);
});

function concatenationAdHoc(chaines, reponse){
    let parite;
    if(reponse % 2 === 0){
      parite = "paire";
    } else {
      parite = "impaire";
    }
    return `${chaines[0]}${parite}.`;
  }
  // concaténation spécifique où on modifie la sortie
  console.log(concatenationAdHoc`La réponse est ${rep}.`);
  speechSynthesis.speak(msg);



  // Nouveau code entièrement 
button.addEventListener("click", function(event){
    const word = document.querySelector(".word");
    window.speechSynthesis.speak(msg);
}  );




SpeechSynthesisVoice.lang = "en"
const button = document.querySelector('word');
button.addEventListener('click', (event) => {
    // Callback
    event.currentTarget.innerText = 'Hold still...';
    event.currentTarget.setAttribute("disabled", "");
   const test = new SpeechSynthesisVoice  
   const texti = new SpeechSynthesisUtterance(button)
   const synth = window.SpeechSynthesis
   window.speechSynthesis.speak(test)

});
