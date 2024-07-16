class OtherBoard < ApplicationRecord
  belongs_to :kanban_board
  belongs_to :subscriber, class_name: "User"
end
