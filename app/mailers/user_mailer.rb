class UserMailer < ApplicationMailer
  def send_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site',content_type: 'multipart/alternative',boundary: "boundary-string")
  end
end
