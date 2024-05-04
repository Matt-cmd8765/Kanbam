class KanbanBoard < ApplicationRecord
	belongs_to :user
  has_many :kanban_columns
end