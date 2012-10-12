class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.text :about

      t.timestamps
    end
  end
end
