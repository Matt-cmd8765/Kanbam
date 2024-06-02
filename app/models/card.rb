class Card < ApplicationRecord
  belongs_to :kanban_column

  # from the ranked model gem https://github.com/brendon/ranked-model needed for sorting cards and columns
  include RankedModel
  ranks :row_order, with_same: :kanban_column_id
end
