# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@taskmanager.com'
  layout 'mailer'
end
