require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Todoist < OmniAuth::Strategies::OAuth2
      option :name, "todoist"
      option :scope, "data:read"

      option :client_options, {
        site:          "https://todoist.com/",
        token_url:     "https://todoist.com/oauth/access_token",
        authorize_url: "https://todoist.com/oauth/authorize"
      }

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      uid { raw_info["user"]["id"].to_s }

      extra do
        {
          email:    raw_info["user"]["email"],
          timezone: raw_info["user"]["tz_info"]["timezone"],
          raw_info: raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        params = { token: access_token.token, sync_token: "*", resource_types: '["user"]' }
        @raw_info ||= access_token.get("/API/v7/sync", params: params).parsed
      end
    end
  end
end
