require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Medium < OmniAuth::Strategies::OAuth2
      option :name, 'medium'
      option :scope, 'basicProfile'

      option :client_options, {
        site: 'https://api.medium.com/v1',
        authorize_url: 'https://medium.com/m/oauth/authorize',
        token_url: "https://api.medium.com/v1/tokens",
        state: 'dGhlcmUncyBubyBuZWVkIHRvIGZlYXIuLi4=',
        response_type: 'code',
        redirect_uri: 'http%3A%2F%2Ftests.dev%2Fauth%2Fmedium%2Fcallback'
      }

      uid { info["id"] }

      info { @info ||= access_token.get("me").parsed["data"] }
    end
  end
end
