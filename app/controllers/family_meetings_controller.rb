class FamilyMeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient
  before_action :set_family_meeting, only: %i[show edit update destroy]

  def index
    @family_meetings = @patient.family_meetings
  end

  def show
    # @family_meeting já está definido
  end

  def new
    @family_meeting = @patient.family_meetings.build
  end

  def create
    @family_meeting = @patient.family_meetings.build(family_meeting_params)
    if @family_meeting.save
      redirect_to [@patient, @family_meeting], notice: 'Reunião familiar criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @family_meeting já está definido
  end

  def update
    if @family_meeting.update(family_meeting_params)
      redirect_to [@patient, @family_meeting], notice: 'Reunião familiar atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @family_meeting.destroy
    redirect_to patient_family_meetings_path(@patient), notice: 'Reunião familiar excluída com sucesso.'
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def set_family_meeting
    @family_meeting = @patient.family_meetings.find(params[:id])
  end

  def family_meeting_params
    params.require(:family_meeting).permit(
      :data_reuniao,
      :supervisor_id,
      :descricao,
      :feedback_familiar
    )
  end
end