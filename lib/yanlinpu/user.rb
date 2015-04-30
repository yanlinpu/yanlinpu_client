module Yanlinpu
  class User
    def initialize(options)
      @remote_user = RpcServer.remote_user_new(options)
    end

    class << self
      def sing(song)
        RpcServer.remote_user_sing(song)
      end
    end
    def method_missing(method, *args, &block)
      @remote_user.send method, *args, &block
    end
  end
end
