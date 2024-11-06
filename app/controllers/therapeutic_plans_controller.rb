class TherapeuticPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_therapeutic_plan, only: %i[show edit update destroy]

  def index
    @therapeutic_plans = @patient.therapeutic_plans
  end

  def show
    # @therapeutic_plan já está definido
  end

  def new
    @therapeutic_plan = @patient.therapeutic_plans.build
  end

  def create
    @therapeutic_plan = @patient.therapeutic_plans.build(therapeutic_plan_params)
    if @therapeutic_plan.save
      redirect_to [@patient, @therapeutic_plan], notice: 'Plano terapêutico criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @therapeutic_plan já está definido
  end

  def update
    if @therapeutic_plan.update(therapeutic_plan_params)
      redirect_to [@patient, @therapeutic_plan], notice: 'Plano terapêutico atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @therapeutic_plan.destroy
    redirect_to patient_therapeutic_plans_path(@patient), notice: 'Plano terapêutico excluído com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_therapeutic_plan
    @therapeutic_plan = @patient.therapeutic_plans.find(params[:id])
  end

  def therapeutic_plan_params
    params.require(:therapeutic_plan).permit(
      :data_inicio,
      :data_fim,
      :objetivos,
      :descricao,
      :carga_horaria,
      :status
    )
  end
end