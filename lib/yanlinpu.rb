# Libraries
require 'drb'

require_relative 'yanlinpu/user'

server_ip = '127.0.0.1'
server_port = 9000
local_ip = '127.0.0.1'
local_port = 0
DRb.start_service "druby://#{local_ip}:#{local_port}"
$rpc_server = DRbObject.new_with_uri "druby://#{server_ip}:#{server_port}"

class RpcServer
  def self.method_missing(method, *args, &block)
    $rpc_server.send method, *args, &block
  end

  def self.check
    result = $rpc_server.send :remote_check
    puts 'server ok...' if result == 'server ok'
  rescue
    $rpc_server = DRbObject.new_with_uri "druby://#{server_ip}:#{server_port}"
  end
end
