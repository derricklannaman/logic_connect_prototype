class CodeList < ApplicationRecord
  has_and_belongs_to_many :icd10_cm_diagnosis_codes
end
