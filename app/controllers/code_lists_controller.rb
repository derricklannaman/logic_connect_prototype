class CodeListsController < ApplicationController
  before_action :set_code_list, only: [:show, :edit, :update, :destroy, :remove_codes, :submit_code_list]

  def index
    @lists = CodeList.where(code_system: "ICD10 CM Diagnosis")
    @code_list = CodeList.all
    @new_code_list = CodeList.new
    # if params[:list_name].present?
    #   @list = CodeList.find(params[:list_name])
    # end
    @code_system_type = ['ICD10 CM Diagnosis', 'ICD10 CM Procedure',
                        'ICD9 CM Diagnosis', 'ICD9 CM Procedure']
  end

  def show
    @icd10cm = Icd10CmDiagnosisCode.first(50)
    @current_list_codes = @code_list.icd10_cm_diagnosis_codes
    if params[:q].present?
      search
    end
  end

  def method
  end
  

  def new
  end

  def edit
  end

  def create
    @code_list = CodeList.new(code_list_params)
    respond_to do |format|
      if @code_list.save
        format.html { redirect_to @code_list, notice: "Code list:#{@code_list.name} was successfully created." }
        format.json { render :show, status: :created, location: @code_list }
      else
        format.html { render :new }
        format.json { render json: @code_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @code_list.update(code_list_params)
        format.html { redirect_to @code_list, notice: 'Code list was successfully updated.' }
        format.json { render :show, status: :ok, location: @code_list }
      else
        format.html { render :edit }
        format.json { render json: @code_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @code_list.destroy
    respond_to do |format|
      format.html { redirect_to code_lists_url, notice: 'Code list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def gather_codes
    if params[:checked_codes].present?
      code_list_id = request.referer.split('/').last
      code_list = CodeList.find(code_list_id)

      params[:checked_codes].each do |name|
        code = Icd10CmDiagnosisCode.find_by(code: name)
        code_list.icd10_cm_diagnosis_codes << code
      end
    elsif params[:codes_searched].present?
      code_list_id = request.referer.split('/').last
      code_list = CodeList.find(code_list_id)
      code = Icd10CmDiagnosisCode.find_by(code: params[:codes_searched])
      code_list.icd10_cm_diagnosis_codes << code
    end
      redirect_to code_list_path code_list.id
  end

  def submit_code_list
    @codes = @code_list.icd10_cm_diagnosis_codes
    xml_file = MeasureXmlBuilder.new(@codes, @code_list.name)
    xml_file.file_creator

    redirect_to code_lists_path
  end

  def remove_codes
    @code_list.icd10_cm_diagnosis_codes.destroy(params[:item_id])
    redirect_back fallback_location: @code_list
  end

  def autocomplete
    render json: Icd10CmDiagnosisCode.search(params[:term], fields: [{info: :text_middle, code: :text_start}],
                                             limit: 30).map(&:info)
  end

  def search
    @search_results = Icd10CmDiagnosisCode.search params[:q], match: :phrase,
                                               misspellings: {edit_distance: 3}

    @code = @search_results.to_a.first
  end

  private

    def set_code_list
      @code_list = CodeList.find(params[:id])
    end

    def code_list_params
      params.require(:code_list).permit(:name, :code_system, :count, :description)
    end
end
