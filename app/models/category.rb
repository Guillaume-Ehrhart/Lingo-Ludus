class Category < ApplicationRecord
  has_many :words
  has_many :games

  validates :name, presence: true
  validates :name, uniqueness: true
end
