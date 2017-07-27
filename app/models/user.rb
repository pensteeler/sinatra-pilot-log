class User < ActiveRecord::Base
  has_many :airplanes

  has_secure_password

end
