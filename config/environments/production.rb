# frozen_string_literal: true

Rails.application.configure do

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :debug
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name: ENV['MAILER_USERNAME'],
    password: ENV['MAILER_PASSWORD'],
    address: ENV['MAILER_ADDRESS'],
    port: ENV['MAILER_PORT'],
    domain: ENV['MAILER_DOMAIN'],
    authentication: ENV['MAILER_AUTHENTICATION'],
    enable_starttls_auto: true,
  }
  config.active_record.dump_schema_after_migration = false

end
