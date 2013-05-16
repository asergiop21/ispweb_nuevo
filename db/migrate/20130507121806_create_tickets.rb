class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :issue
      t.text :message
      t.boolean :status
      t.integer :departament
      t.integer :priority
      t.text :reply
      t.integer :user_id
      t.integer :path_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
