class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :profession_name

      t.timestamps
    end
  end
end
