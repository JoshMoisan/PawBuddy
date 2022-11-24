class Dog < ApplicationRecord
  has_many :dogs
  has_one_attached :photo
  belongs_to :user
  validates :name, presence: true
  validates :description, length: { minimum: 15 }
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
