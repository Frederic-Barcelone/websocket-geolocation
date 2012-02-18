class AdditionalDeviceInformation < ActiveRecord::Base
  belongs_to :device
  belongs_to :android
end
