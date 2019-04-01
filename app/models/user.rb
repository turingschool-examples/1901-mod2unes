class User < ApplicationRecord
  # validates :username, presence: true, uniqueness: true
  # validates :password, presence: true
  validates_presence_of :username, :password

  validates :username, uniqueness: true

  has_secure_password

  enum role: ['default', 'admin']
end
