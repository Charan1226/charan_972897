class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :patient
      t.text :problem
      t.integer :doctor_id
      
      
      t.timestamps null: false
    end
  end
end
