class UserMailer < ActionMailer::Base
  default from: "from@example.com"



  def confirmation_email(user)
    @user = user
    @url  =  signin_path
    root_path
    mail(to: @user.email, subject: 'Please confirm your email')
  end
end
