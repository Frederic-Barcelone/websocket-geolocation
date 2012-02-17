require "xmlrpc/parser"
require "xmlrpc/create"
require "xmlrpc/config"
require "xmlrpc/utils"

class LibXMLRPCServer < XMLRPC::BasicServer
  def process(data)
    parsed = LibXMLRPC::Parser.new(data)
    method, params = parsed.method, parsed.params
    handle(method, *params)
  end
end
