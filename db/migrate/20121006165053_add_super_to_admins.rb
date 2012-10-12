class AddSuperToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :super, :integer, default: 0 
  end
end
