class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact
      t.text :address

      t.timestamps
    end
  end
end
