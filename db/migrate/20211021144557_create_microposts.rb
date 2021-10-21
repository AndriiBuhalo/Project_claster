class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.integer :user_id
      t.references :user

      t.timestamps
    end
  end
end
