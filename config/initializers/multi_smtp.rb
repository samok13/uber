sendgrid_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  domain: 'heroku.com',
  password: ENV['SENDGRID_PASSWORD'],
  user_name: ENV['SENDGRID_USERNAME'],
  :enable_starttls_auto => true
}
#config.action_mailer.delivery_method ||= :smtp

aws_email_settings = {
  access_key_id: ENV['AMAZON_ACCESS_KEY'],
  secret_access_key: ENV['AMAZON_SECRET_KEY']
}
  #config.action_mailer.delivery_method = :ses

MultiSMTP.smtp_providers = [sendgrid_settings, aws_email_settings]



