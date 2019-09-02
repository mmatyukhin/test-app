class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :description
      t.boolean :banned

      t.timestamps
    end
  end
end
