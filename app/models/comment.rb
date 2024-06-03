class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :card

  validates :comment, presence: true
end
