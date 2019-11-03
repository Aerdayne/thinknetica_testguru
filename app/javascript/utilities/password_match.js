document.addEventListener('turbolinks:load', function() {
  var pConfirmation = document.getElementById('user_password_confirmation')
  var pField = document.getElementById('user_password')
  if (pConfirmation) { pConfirmation.addEventListener('input', func) }
  if (pField) { pField.addEventListener('input', func) }
})

function func() {
  var passwordField = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')
  if (passwordField.value == '' && passwordConfirmation.value == '') {
    passwordField.classList.remove('is-invalid')
    passwordConfirmation.classList.remove('is-invalid')
    passwordField.classList.remove('is-valid')
    passwordConfirmation.classList.remove('is-valid')
  } else if (passwordField.value != passwordConfirmation.value) {
    passwordField.classList.remove('is-valid')
    passwordConfirmation.classList.remove('is-valid')
    passwordField.classList.add('is-invalid')
    passwordConfirmation.classList.add('is-invalid')
  } else {
    passwordField.classList.remove('is-invalid')
    passwordConfirmation.classList.remove('is-invalid')
    passwordField.classList.add('is-valid')
    passwordConfirmation.classList.add('is-valid')
  }
}