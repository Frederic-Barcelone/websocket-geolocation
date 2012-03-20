class XmlrpcController < ApplicationController
  skip_before_filter :verify_authenticity_token

  xmlrpc_setup

  xmlrpc_error :user_not_found_error, :code => 1, :message => "UserNotFoundError"
  xmlrpc_error :device_imei_not_found_error, :code => 2, :message => "DeviceImeiNotFoundError"
  xmlrpc_error :device_not_found_error, :code => 3, :message => "DeviceNotFoundError"

  def authenticate(email, certification_code, system)
    if user = User.find_by_email_and_certification_code(email,certification_code)
      imei = system.delete("imei")
      raise device_imei_not_found_error if imei.blank?
      android = user.androids.find_or_create_by_imei(imei)
      system.each_pair do |key, value|
        android.additional_device_informations.create(:key => key, :value => value)
      end

      return android.uuid
    else
      raise user_not_found_error
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
      raise device_not_found_error
    end
  end

end
