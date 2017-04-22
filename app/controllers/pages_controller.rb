class PagesController < ApplicationController
  def index
  end

  def measures
    @side_panel_list = ["Measure List 1", "Measure List 2", "Measure List 3"]
  end

  def packages
    @side_panel_list = ["Package 1 Diagnosis", "Package 1 Procedure", "Package 1 Procedure"]
  end

  def code_list
    @side_panel_list = ["ICD10 CM Diagnosis", "ICD10 CM Procedure", "ICD9 CM Procedure"]
  end

  def reports
    @side_panel_list = ["Report 1", "Report 1", "Report 1"]
  end

  def jobs
    @side_panel_list = ["Jobs Lists 1", "Jobs Lists 2", "Jobs Lists 3"]
  end
end