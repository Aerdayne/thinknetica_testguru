class TestsMailer < ApplicationMailer
  def completed_test(taken_test)
    @user = taken_test.user
    @test = taken_test.test

    mail to: @user.email, subject: "You just completed the #{@test.title} test!"
  end
end
