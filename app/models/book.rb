class Book < ApplicationRecord
  has_many :users
  validates :category, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  validates :available, presence: true
end
