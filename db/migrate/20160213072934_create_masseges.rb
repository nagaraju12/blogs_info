class CreateMasseges < ActiveRecord::Migration
  def change
    create_table :masseges do |t|
      t.string :name
      t.text :message
       t.string :user_id
       t.string :friend_id
          	t.string   :status
      t.timestamps null: false
    end
  end
end
