class KanbanColumn < ApplicationRecord
  belongs_to :kanban_board

  validates :name, presence: true

  has_many :cards, dependent: :destroy

  # from the ranked model gem https://github.com/brendon/ranked-model
  include RankedModel
  ranks :row_order, with_same: :kanban_board_id
  accepts_nested_attributes_for :cards, reject_if: :all_blank, allow_destroy: true
end
