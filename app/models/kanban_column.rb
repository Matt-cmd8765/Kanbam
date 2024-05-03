class KanbanColumn < ApplicationRecord
  has_many :cards
  belongs_to :kanban_board
end
