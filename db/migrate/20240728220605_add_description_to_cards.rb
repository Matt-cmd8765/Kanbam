class AddDescriptionToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :description, :text
  end
end
