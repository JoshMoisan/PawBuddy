class User < ApplicationRecord
    has_many :bookings
    has_many :dogs
    has_many :dogs, through: :bookings
end