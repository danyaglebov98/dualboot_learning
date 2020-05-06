# frozen_string_literal: true

class Web::ApplicationController <
  include Concerns::AuthHelper
  helper_method :current_user
end
