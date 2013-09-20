class CreateMikrotiks < ActiveRecord::Migration
  def change
    create_table :mikrotiks do |t|
      t.string :ip
      t.string :user
      t.string :pass
      t.string :port
      t.integer :user_id

      t.timestamps
    end
  end
end
