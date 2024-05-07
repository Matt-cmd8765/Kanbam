class KanbanColumn < ApplicationRecord
  has_many :cards
  belongs_to :kanban_board

  # from the ranked model gem https://github.com/brendon/ranked-model
  include RankedModel
  ranks :row_order
end
