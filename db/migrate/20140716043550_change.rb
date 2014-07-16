class Change < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :cellphone, :string
    end
  end
  def self.down
    change_table :users do |t|
      t.change :cellphone, :integer
    end
  end
end

