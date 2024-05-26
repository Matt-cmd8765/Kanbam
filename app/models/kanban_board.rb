class KanbanBoard < ApplicationRecord
  validates :name, presence: true, on: :create
	belongs_to :user
  has_many :kanban_columns
  accepts_nested_attributes_for :kanban_columns
end