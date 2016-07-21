class Lease < ApplicationRecord
  enum status: {requested: 0, borrowed: 1}
  belongs_to :user
  belongs_to :book
  validates :book_id, presence: true
  validates :user_id, presence: true

  def accept
    decrement(:available, 1)
  end
  def return
    increment(:available, 1)
  end
end
