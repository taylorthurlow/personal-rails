class Login < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :username, length: { minimum: 2 }
  validates :password, length: { minimum: 8 }
end
