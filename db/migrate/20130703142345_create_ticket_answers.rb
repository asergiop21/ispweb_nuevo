class CreateTicketAnswers < ActiveRecord::Migration
  def change
    create_table :ticket_answers do |t|
      t.string :message
      t.integer :user_id
      t.integer :ticket_id
      
      t.timestamps
    end
  end
end
