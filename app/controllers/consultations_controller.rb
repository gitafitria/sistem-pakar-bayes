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
    @results = calculate_result(consultation_params)
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

    def calculate_result(params)
      indications = params[:indication_ids].join(',')
      @rules = Rule.where("indication_id in (#{indications})").joins(:trouble, :indication).group_by(&:trouble_id)

      sum_multiply = 0
      troubles_multiply = {}
      troubles_result = {}

      @rules.each do |trouble_id, trouble_indications|
        trouble = Trouble.find(trouble_id)
        trouble_multiply = trouble.weight

        trouble_indications.each do |indication|
          trouble_multiply = trouble_multiply * indication.weight
        end

        sum_multiply = sum_multiply + trouble_multiply
        troubles_multiply["#{trouble_id}"] = trouble_multiply
      end

      troubles_multiply.each do |trouble_id, multiply|
        result = multiply / sum_multiply
        troubles_result["#{trouble_id}"] = result
      end

      # puts "troubles_result"
      # puts "#{troubles_result.max_by{|k,v| v}}"

      return {
        selected_indications: indications,
        troubles_multiply: troubles_multiply,
        sum_multiply: sum_multiply,
        troubles_result: troubles_result,
      }
    end
end
