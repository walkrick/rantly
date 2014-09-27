class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|

      t.string :rant, null: false
      t.string :rant_title, null: false
      t.integer :user_id, null: false


    end
  end
end
