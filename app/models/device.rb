class Device < ActiveRecord::Base
  belongs_to :user
  has_many :locations

  before_create :generate_guid

  def generate_guid
    self.guid ||= UUIDTools::UUID.random_create.to_s
  end
end
