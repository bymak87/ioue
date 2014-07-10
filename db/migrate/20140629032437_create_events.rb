class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string  :name
      t.string  :pay_date
      t.timestamps
    end
  end
end
