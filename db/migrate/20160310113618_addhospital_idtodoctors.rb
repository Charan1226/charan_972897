class AddhospitalIdtodoctors < ActiveRecord::Migration
  def change
   add_column :doctors , :hospital_id , :integer
  end
end
