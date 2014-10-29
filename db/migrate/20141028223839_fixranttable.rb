class Fixranttable < ActiveRecord::Migration
  def change
    remove_column :rants, :rant
    add_column :rants, :rant, :text

  end
end
