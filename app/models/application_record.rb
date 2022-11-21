class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end


# booking
# belongs_to :user
# belongs_to :dog
# validates :start_date, :end_date, presence: true

# has_many :dogs
# belongs_to :user
# validates :name, presence: true
# validates :description, length: { minimum: 15 }

# has_many :bookings
# has_many :dogs
# has_many :dogs, through: :bookings
# validates :first_name, :last_name, presence: true
# validates :email, presence: true, uniqueness: true, format: { with: /\A(\S+)@(.+)\.(\S+)\z/ }
# validates :password, length: { in: 6..20 }
