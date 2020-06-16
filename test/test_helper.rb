# frozen_string_literal: true

require 'simplecov'
require 'coveralls'

SimpleCov.start
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include ActionMailer::TestHelper
  include FactoryBot::Syntax::Methods
  include AuthHelper
end
