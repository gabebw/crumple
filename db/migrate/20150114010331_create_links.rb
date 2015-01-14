class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url, null: false

      t.timestamps null: false
    end
  end
end
