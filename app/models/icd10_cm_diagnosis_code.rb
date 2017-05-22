# Icd10CmDiagnosisCode.count
class Icd10CmDiagnosisCode < ApplicationRecord
  has_and_belongs_to_many :code_lists

  searchkick text_middle: [:info]

  def search_data
    {
      code: code,
      info: info
    }
  end
end
