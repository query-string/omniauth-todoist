require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Todoist < OmniAuth::Strategies::OAuth2
      option :name, "todoist"

      option :client_options, {
        site:          "https://developer.todoist.com",
        token_url:     "https://todoist.com/api/access_tokens",
        authorize_url: "https://todoist.com/oauth/authorize"
      }
      option :scope, "data:read"
    end
  end
end
