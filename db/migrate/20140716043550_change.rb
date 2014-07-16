class Change < ActiveRecord::Migration
  def change
      change_table :users do |t|
        t.change :cellphone, :string
     end
  end
end

