class KanbanColumn < ApplicationRecord
  validates :name, presence: true, on: :create
  has_many :cards, dependent: :destroy
  belongs_to :kanban_board

  # from the ranked model gem https://github.com/brendon/ranked-model
  include RankedModel
  ranks :row_order
  accepts_nested_attributes_for :cards, reject_if: :all_blank, allow_destroy: true
end
