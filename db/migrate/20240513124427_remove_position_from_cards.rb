class RemovePositionFromCards < ActiveRecord::Migration[7.1]
  def change
    remove_column(:cards, :position)
  end
end
