class MultiSMTP < Mail::SMTP
  cattr_accessor :smtp_providers

  def initialize(default_settings)
    @default_settings = default_settings
  end

  def deliver!(mail)
    smtp_providers.each_with_index do |smtp_provider, index|
      self.settings = default_settings.merge(smtp_provider)

      begin
        super(mail)
        break
      rescue Exception => e
        if last_smtp_provider? index
          # Airbrake notification
        else
          # error message
        end
      end
    end
  end

  private

  def smtp_providers
    self.class.smtp_providers
  end

  def last_smtp_provider?(index)
    (smtp_providers.size - 1) == index
  end

  attr_reader :default_settings
end

ActionMailer::Base.add_delivery_method(:multi_smtp, MultiSMTP)