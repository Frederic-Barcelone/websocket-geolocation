# -*- coding: utf-8 -*-
require "xmlrpc/parser"
require "xmlrpc/server"

module XmlrpcEndpoint
  module InstanceMethods
    def xe_index
      result = @xmlrpc_server.process(request.body)
      puts "\n\n----- BEGIN RESULT -----\n#{result}----- END RESULT -----\n\n"
      render :text => result, :content_type => 'text/xml'
    end

    private

    def add_method_handlers
      @xmlrpc_server = LibXMLRPCServer.new
      self.class.instance_methods(false).each do |method|
        unless method == 'xe_index'
          puts "Adding XMLRPC method for #{method.to_s}"
          @xmlrpc_server.add_handler(method.try(:to_s)) do |*args|
            self.send(method.to_sym, *args)
          end
        end
      end
    end
  end

  module Error
    class UndefinedXmlrpcError < StandardError; end
    class AbstractXmlrpcError < XMLRPC::FaultException

      def initialize
        super(error_code, message)
      end

      def error_code
        raise UndefinedXmlrpcError.new("error_codeが定義されていません")
      end

      def message
        self.class.to_s.split("::").last
      end

      def to_h
        super.merge("Success" => false)
      end
    end

    class UserNotFoundError < AbstractXmlrpcError
      def error_code; 001 end
    end
    class DeviceNotFoundError < AbstractXmlrpcError
      def error_code; 002 end
    end
    class DeviceImeiNotFoundError < AbstractXmlrpcError
      def error_code; 003 end
    end
    class InternalServerError < AbstractXmlrpcError
      def error_code; 999 end
    end
  end

  class LibXMLRPCServer < XMLRPC::BasicServer
    def process(data)
      parsed = LibXMLRPC::Parser.new(data)
      method, params = parsed.method, parsed.params
      handle(method, *params)
    end
  end
end
