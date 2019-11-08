document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.answer-form')

  if (form.dataset.timeLeft) { 
    var timer = document.querySelector('.timer')
    var timeLeft = parseInt(form.dataset.timeLeft)
    timer.innerHTML = parseTime(timeLeft)
  
    var interval = setInterval(() => {
      timeLeft -= 1
      if (timeLeft < 1) { clearInterval(interval) }
      timer.innerHTML = parseTime(timeLeft)
    }, 1000)
  }
})

function parseTime(timeLeft) {
  var minutes = Math.floor(timeLeft / 60)
  var seconds = ((timeLeft % 60)).toFixed(0)

  return minutes + ":" + (seconds < 10 ? '0' : '') + seconds;
}