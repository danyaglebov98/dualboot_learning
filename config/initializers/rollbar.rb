Rollbar.configure do |config|

  config.access_token = '77b8826279231b57d13539a61728837e2ca92fec'

  if Rails.env.test? || Rails.env.development?
    config.enabled = false
  end

  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env
end
