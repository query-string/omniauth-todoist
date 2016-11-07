require "omniauth-todoist/version"
require "omniauth"

module OmniAuth
  module Strategies
    autoload :Todoist,  "omniauth/strategies/todoist"
  end
end

OmniAuth.config.add_camelization "todoist", "Todoist"
