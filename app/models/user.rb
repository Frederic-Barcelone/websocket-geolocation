class User < ActiveRecord::Base
  # Const
  CERT_CODE_LEN = 6
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :devices

  before_create :generate_certification_code
  def generate_certification_code
    self.certification_code ||= rand_str(CERT_CODE_LEN)
  end

  def rand_str(len)
    list = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    Array.new(len){list[rand(list.size)]}.join
  end
end
