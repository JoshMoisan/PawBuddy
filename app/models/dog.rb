class Dog < ApplicationRecord
    has_many :dogs
    belongs_to :user
end
