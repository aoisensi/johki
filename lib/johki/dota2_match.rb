require "johki/client"
require "johki/interface"

module Johki
  class IDOTA2Match < Interface
    def initialize(client, appid)
      super(client, "IDOTA2Match_#{appid}")
    end

    def get_match_details(params)
      path = path("GetMatchDetails/v1")
      @client.get(path, params)
    end

    def get_match_history(params)
      path = path("GetMatchHistory/v1")
      @client.get(path, params)
    end
  end
end