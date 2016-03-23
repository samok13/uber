class UserMailer < ApplicationMailer
  default :from => "founders@choice.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Choice!')
  end
end
