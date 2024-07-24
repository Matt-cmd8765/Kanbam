class Card < ApplicationRecord
  # ! validations
  validates :name, presence: true, on: :create
  validates :kanban_column_id, presence: true, on: :create


  belongs_to :kanban_column
  has_many :comments

  # * from the ranked model gem https://github.com/brendon/ranked-model needed for sorting cards and columns
  include RankedModel
  ranks :row_order, with_same: :kanban_column_id

  accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
end
