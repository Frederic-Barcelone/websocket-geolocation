class XmlrpcController < ApplicationController
  skip_before_filter :verify_authenticity_token

  xmlrpc
  include XmlrpcErrors

  def authenticate(email, certification_code, system)
    if user = User.find_by_email_and_certification_code(email,certification_code)
      imei = system.delete("imei")
      raise DeviceImeiNotFoundError if imei.blank?
      android = user.androids.find_or_create_by_imei(imei)
      system.each_pair do |key, value|
        android.additional_device_informations.create(:key => key, :value => value)
      end

      return android.uuid
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
