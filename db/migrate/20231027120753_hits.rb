class Hits < ActiveRecord::Migration[7.1]
  def change
    create_table :hits do |t|
      t.string :endpoint, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
