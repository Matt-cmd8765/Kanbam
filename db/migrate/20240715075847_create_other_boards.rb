class CreateOtherBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :other_boards do |t|
      t.integer :owner_id
      t.integer :subscriber_id
      
      t.timestamps
    end
  end
end
