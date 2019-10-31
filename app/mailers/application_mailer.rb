class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <main@testguru.com>)
  layout 'mailer'
end
