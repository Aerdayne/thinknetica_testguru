document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.answer-form')

  if (form.dataset.endTime) { 
    var timer = document.querySelector('.timer')
    var startTime = new Date(parseInt(form.dataset.startTime))
    var endTime = new Date(parseInt(form.dataset.endTime))
    var interval = setInterval(() => {
      currentTime = new Date()
      timeLeft = Math.abs(endTime - currentTime.getTime())
      if ((endTime - currentTime.getTime()) < 0) { clearInterval(interval) }
      timer.innerHTML = timeLeft
    }, 1000)
  }
  // format date display, figure out the calculations
})
