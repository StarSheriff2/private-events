class AddCreatorRefToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :integer
    add_index :events, :creator_id
  end
end
