class Book < ApplicationRecord
  validates :category, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :year_published, presence: true
  validates :edition, presence: true
end
