class ConsultationsController < ApplicationController
  # before_action :set_consultation, only: [:show, :edit, :update, :destroy]

  # GET /consultations
  # GET /consultations.json
  def index
    # @consultations = Consultation.all
    @indications = Indication.all
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
  end

  # GET /consultations/new
  def new
    # @consultation = Consultation.new
  end

  # GET /consultations/1/edit
  def edit
  end

  def create
    puts "consultation_params"
    puts consultation_params
    # s
    puts ">>>>>>>>>>>>>> HAHAHAHAH"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params[:consultation]
    end
end
