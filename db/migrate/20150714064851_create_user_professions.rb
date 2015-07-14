class CreateUserProfessions < ActiveRecord::Migration
  def change
    create_table :user_professions do |t|
      t.integer :user_id, null: false
      t.integer :profession_id, null: false

      t.timestamps
    end
    add_index :user_professions, :user_id
    add_index :user_professions, :profession_id
    add_index :user_professions, [:user_id, :profession_id], unique: true
  end
end