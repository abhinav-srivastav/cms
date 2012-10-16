class ChangeActiveContentToProducts < ActiveRecord::Migration
  def up
  	change_column :products, :active_content, :boolean
  end

  def down
  	change_column :products, :active_content, :integer
  end
end
