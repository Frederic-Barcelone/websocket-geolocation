class Device < ActiveRecord::Base
  belongs_to :user
  has_many :locations
  has_many :additional_device_informations
  before_create :generate_uuid

  def generate_uuid
    self.uuid ||= UUIDTools::UUID.random_create.to_s
  end
end
