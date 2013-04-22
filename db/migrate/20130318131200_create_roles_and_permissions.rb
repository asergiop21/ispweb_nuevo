class CreateRolesAndPermissions < ActiveRecord::Migration
  def change
    create_table :roles_and_permissions do |t|
      t.string :scope
      t.references :role
      t.references :permmision
      t.timestamps
    end

    add_index :roles_and_permissions, :role_id
    add_index :roles_and_permissions, :permmision_id

  end
end
