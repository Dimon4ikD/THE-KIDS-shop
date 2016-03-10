class ApplicationMailer < ActionMailer::Base
  default from: "test@shop.com"
  layout 'mailer'
end
