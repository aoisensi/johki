module Johki
  class Interface
    def initialize(client, interface)
      @client = client
      @interface = interface
    end

    protected
    def path(method)
      @interface + "/" + method
    end
  end
end
