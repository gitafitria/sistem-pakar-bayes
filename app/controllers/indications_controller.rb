class IndicationsController < ApplicationController
  before_action :set_indication, only: [:show, :edit, :update, :destroy]

  # GET /indications
  # GET /indications.json
  def index
    @indications = Indication.order(:created_at)
  end

  # GET /indications/1
  # GET /indications/1.json
  def show
  end

  # GET /indications/new
  def new
    @indication = Indication.new
  end

  # GET /indications/1/edit
  def edit
  end

  # POST /indications
  # POST /indications.json
  def create
    @indication = Indication.new(indication_params)
    @indication.is_active = true
    
    respond_to do |format|
      if @indication.save
        format.html { redirect_to indications_path, notice: 'Indication was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /indications/1
  # PATCH/PUT /indications/1.json
  def update
    respond_to do |format|
      if @indication.update(indication_params)
        format.html { redirect_to indications_path, notice: 'Indication was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /indications/1
  # DELETE /indications/1.json
  def destroy
    @indication.destroy
    respond_to do |format|
      format.html { redirect_to indications_url, notice: 'Indication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indication
      @indication = Indication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indication_params
      params.require(:indication).permit(:indication_name, :is_active)
    end
end
