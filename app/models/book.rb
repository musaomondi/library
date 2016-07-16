class Book < ApplicationRecord
  belongs_to :users
  validates :category, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :year_published, presence: true
  validates :edition, presence: true
end
