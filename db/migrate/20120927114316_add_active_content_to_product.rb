class AddActiveContentToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :active_content, :number
  end
end
