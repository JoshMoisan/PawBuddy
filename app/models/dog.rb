class Dog < ApplicationRecord
  has_many :dogs
  belongs_to :user
  validates :name, presence: true
  validates :description, length: { minimum: 15 }
end
