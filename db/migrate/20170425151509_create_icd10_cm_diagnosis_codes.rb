class CreateIcd10CmDiagnosisCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :icd10_cm_diagnosis_codes do |t|
      t.string :code
      t.string :code_system
      t.string :description
      t.string :info

      t.timestamps
    end
  end
end
