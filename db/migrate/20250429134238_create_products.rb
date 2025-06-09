class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :profit
      t.string :category
      t.string :size

      t.timestamps
    end
  end
end
