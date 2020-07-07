# frozen_string_literal: true

require 'simplecov'
require 'coveralls'
require 'sidekiq/testing'
SimpleCov.start
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

Sidekiq::Testing.inline!

class ActiveSupport::TestCase
  include ActionMailer::TestHelper
  include FactoryBot::Syntax::Methods
  include AuthHelper
  parallelize(workers: 1)
end
