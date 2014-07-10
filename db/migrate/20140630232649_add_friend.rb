class AddFriend < ActiveRecord::Migration
  def change
    add_column :events, :friend, :string
    add_column :events, :amount, :string
  end
end
