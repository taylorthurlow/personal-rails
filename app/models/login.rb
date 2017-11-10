class Login < ActiveRecord::Base
  has_secure_password

  # validation
  validates :username, presence: true, uniqueness: true
  validates :username, length: { in: 2..30 }
  validates :password, length: { in: 4..30 }
end
