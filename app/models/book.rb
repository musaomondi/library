class Book < ApplicationRecord
  has_many :users
  has_many :leases
  validates :category, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  validates :available, presence: true

  def accept
    decrement(:available, 1)
  end
  def return
    increment(:available, 1)
  end
  def self.search(search)
    where("title like? OR author like? OR category like?", "%#{search}%", "%#{search}%","%#{search}%")
  end
end
