class ChangeDatetimeColumnOnEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :date, :datetime
  end
end
