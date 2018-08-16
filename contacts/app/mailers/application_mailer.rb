# frozen_string_literal: true
# Application Mailer Base class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
