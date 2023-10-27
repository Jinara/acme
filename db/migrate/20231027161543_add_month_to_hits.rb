class AddMonthToHits < ActiveRecord::Migration[7.1]
  def change
    add_column :hits, :month, :integer, null: false
    add_column :hits, :year, :integer, null: false
    add_column :hits, :current_count, :integer,  null: false
  end
end
