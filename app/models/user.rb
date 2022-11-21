class User < ApplicationRecord
  has_many :bookings
  has_many :dogs
  has_many :dogs, through: :bookings
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A(\S+)@(.+)\.(\S+)\z/ }
  validates :password, length: { in: 6..20 }
end
