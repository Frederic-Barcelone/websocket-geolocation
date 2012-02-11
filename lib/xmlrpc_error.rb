# -*- coding: utf-8 -*-
require "xmlrpc/parser"
module XmlrpcError
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
  class InternalServerError < AbstractXmlrpcError
    def error_code; 999 end
  end
end
