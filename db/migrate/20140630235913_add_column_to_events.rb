class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :day, :date
  end
end
