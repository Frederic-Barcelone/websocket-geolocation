class Location < ActiveRecord::Base
  belongs_to :device
  belongs_to :android
end
