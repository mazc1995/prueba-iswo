class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy ]
  
  # GET /documents or /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1 or /documents/1.json
  def show
    @workflow_state = Document.find(params[:id]).workflow_state
  end

  # GET /documents/new
  def new         
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # PUT /documents/1/update_workflow
  def update_workflow_state
    @workflow_state = Document.find(params[:id]).workflow_state
    if @workflow_state == 'Draft'
      @workflow_state = 'awaiting_review'
    elsif @workflow_state == 'awaiting_review'
      @workflow_state = 'awaiting_approve'
    elsif @workflow_state == 'awaiting_approve'
      @workflow_state = 'approved'
    end    
    Document.find(params[:id]).update({'workflow_state'=>@workflow_state})    
    redirect_to document_path
  end

  # POST /documents or /documents.json
  def create
    parameters = document_params
    cp = Procedure.find(document_params['procedure_id']).code
    cd = DocumentType.find(document_params['document_type_id']).code
    cant = Document.where(document_type_id: parameters['document_type_id'], procedure_id: parameters['procedure_id']).count.to_s
    parameters[:code] = cp+cd+cant    
    @document = Document.new(parameters)    
    respond_to do |format|
      if @document.save
        format.html { redirect_to document_url(@document), notice: "Document was successfully created." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to document_url(@document), notice: "Document was successfully updated." }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url, notice: "Document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:name, :workflow_state, :code, :date, :category, :document_type_id, :procedure_id)
    end
end
