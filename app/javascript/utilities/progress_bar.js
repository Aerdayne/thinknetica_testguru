document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.answer-form')

  if (form) {
    renderProgressBar(form)
  }
})

function renderProgressBar(form) {
  var progressBarWrapper = document.createElement('div')
  progressBarWrapper.classList.add('progress')
  progressBarWrapper.classList.add('mt-2')
  
  var progressBar = document.createElement('div')
  progressBar.setAttribute('class','progress-bar')
  progressBar.setAttribute('role','progress-bar')
  progressBar.setAttribute('aria-valuemin','0')
  progressBar.setAttribute('aria-valuemax','100')

  var currentQuestion = form.dataset.currentQuestionId
  var totalQuestions = form.dataset.questionsAmount

  progressBar.setAttribute('aria-valuenow', (currentQuestion/totalQuestions)*100)
  progressBar.setAttribute('style', 'width: ' + (currentQuestion/totalQuestions)*100 + '%')
  progressBar.value = (currentQuestion/totalQuestions)*100
  progressBarWrapper.appendChild(progressBar)
  form.appendChild(progressBarWrapper)
}