class ChangeCommentToEquipment < ActiveRecord::Migration
  def up
    change_column :equipment, :comment, :text
  end

  def down
    change_column :equipment, :comment, :text
  end
end
