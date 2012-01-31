class XmlrpcController < ApplicationController
  exposes_xmlrpc_methods

  def hello_world(index)
    puts "Hello XMLRPC. #{index}"
    return index
  end
end
