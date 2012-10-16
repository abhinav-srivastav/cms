class AddPreviewToProducts < ActiveRecord::Migration
  def change
    add_column :products, :preview, :boolean
  end
end
