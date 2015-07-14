class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.boolean :doctor
      t.boolean :nurse
      t.boolean :pharmacist
      t.boolean :dentist
      t.boolean :medical_office_worker
      t.boolean :care_worker
      t.boolean :dietitian
      t.boolean :physical_therapist
      t.boolean :emergency_medical_technician
      t.boolean :medical_technologist
      t.boolean :dental_assistant
      
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
