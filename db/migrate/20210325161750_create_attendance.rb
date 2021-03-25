class CreateAttendance < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end

    add_index :attendances, :attendee_id
    add_index :attendances, :attended_event_id
  end
end
