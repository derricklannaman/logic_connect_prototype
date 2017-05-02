class PagesController < ApplicationController
  def index
    @code_system_type = ["ICD10 CM Diagnosis", "ICD10 CM Procedure", "ICD9 CM Procedure"]
  end

  def measures
    @code_system_type = ["Measure List 1", "Measure List 2", "Measure List 3"]
  end

  def packages
    @code_system_type = ["Package 1 Diagnosis", "Package 1 Procedure", "Package 1 Procedure"]
  end

  def code_list
    @code_system_type = ["ICD10 CM Diagnosis", "ICD10 CM Procedure", "ICD9 CM Procedure"]
  end

  def reports
    @code_system_type = ["Report 1", "Report 1", "Report 1"]
  end

  def jobs
    @code_system_type = ["Jobs Lists 1", "Jobs Lists 2", "Jobs Lists 3"]
  end
end