# CodeListsIcd10CmD
class CreateCodeListsIcd10CmD < ActiveRecord::Migration[5.0]
  def change
    create_table :code_lists_icd10_cm_diagnosis_codes do |t|
      t.references :code_list, foreign_key: true, index: { name: 'codes_icd10_diag' }
      t.references :icd10_cm_diagnosis_code, foreign_key: true, index: { name: 'codes_icd10_list' }
    end
  end
end

