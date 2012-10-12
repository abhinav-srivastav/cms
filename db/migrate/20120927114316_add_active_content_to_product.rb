class AddActiveContentToProduct < ActiveRecord::Migration
  def change
  	add_column :products, :active_content, :integer
  end
end
