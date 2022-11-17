class Movie < ApplicationRecord
  has_many :lists
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true
  validates :overview, length: { minimum: 6 }
end
