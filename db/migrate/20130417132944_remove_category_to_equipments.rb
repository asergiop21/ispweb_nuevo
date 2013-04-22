class RemoveCategoryToEquipments < ActiveRecord::Migration
  def up
    remove_column :equipment, :category_id
  end

  def down
    add_column :equipment, :category_id, :string
  end
end
