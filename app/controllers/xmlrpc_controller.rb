class XmlrpcController < ApplicationController
  skip_before_filter :verify_authenticity_token

  include XmlrpcEndpoint::InstanceMethods
  include XmlrpcEndpoint::Error
  before_filter :add_method_handlers, :only => [:xe_index]

  def authenticate(email, certification_code)
    if user = User.find_by_email_and_certification_code(email,certification_code)
      device = user.devices.create
      return device.uuid
    else
      raise UserNotFoundError
    end
  end

  def set_location(device_uuid, longitude, latitude)
    if device = Device.find_by_uuid(device_uuid)
      location = device.locations.new do |lc|
        lc.longitude = longitude
        lc.latitude = latitude
      end
      location.save!
    else
      raise DeviceNotFoundError
    end
    return_success
  end

  private
  def return_success
    return {"Success" => true}
  end

end
