class Owner < ApplicationRecord
  has_many :cars
  has_many :reviews, through: :cars
  has_many :reviews, dependent: :destroy
  validates :nickname, presence: true, uniqueness: true
end
