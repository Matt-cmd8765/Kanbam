class User < ApplicationRecord
  has_many :kanban_boards
  has_many :comments
  has_many :other_boards, foreign_key: :subscriber_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
