class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :user
  belongs_to :card

  # * This is a self join for replies.
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  has_many :likes

  def liked?(comment, user)
    array = []
    comment.likes.each do |like|
      array << like.user_id
    end
    if array.include?(user.id)
      true
    else
      false
    end
  end
end
