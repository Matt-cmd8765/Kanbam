class KanbanBoard < ApplicationRecord
  validates :name, presence: true, on: :create
	belongs_to :user
  has_many :kanban_columns
  # _destory is a special attribute that is used to mark a record for destruction
  accepts_nested_attributes_for :kanban_columns, reject_if: :all_blank, allow_destroy: true
end