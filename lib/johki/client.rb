require "net/http"
require "uri"
require "json"

require "johki/dota2_match"
require "johki/steam_user"
require "johki/error"

module Johki
  class Client
    ROOT_URL = "https://api.steampowered.com/"

    def initialize(token)
      @token = token
    end

    def get(path, params = {})
      params[:key] = @token
      path += "?" + URI.encode_www_form(params)
      uri = URI.parse(ROOT_URL + path)
      result = Net::HTTP.get_response(uri)
      self.parse(result)
    end

    def parse(result)
      if result.code != "200"
        raise JohkiError.new(result.body)
      end
      JSON.parse(result.body, symbolize_names: true)
    end

    def steam_user
      ISteamUser.new(self)
    end

    def dota2_match(appid = 570)
      IDOTA2Match.new(self, appid)
    end
  end
end
