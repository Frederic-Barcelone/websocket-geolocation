class XmlrpcController < ApplicationController
  skip_before_filter :verify_authenticity_token
  exposes_xmlrpc_methods

  def authenticate(email, certification_code, system)
    if user = User.find_by_email_and_certification_code(email,certification_code)
      device = user.devices.create(:model => "model", :imei => "imei")
      return device.guid
    end
    return false
  end
end
