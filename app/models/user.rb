class User < ActiveRecord::Base
  after_create :send_welcome_email


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver!
  end

end
