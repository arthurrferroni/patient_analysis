class SupervisorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_supervisor, only: %i[show edit update destroy]

  def index
    @supervisors = Supervisor.all
  end

  def show
    # @supervisor já está definido
  end

  def new
    @supervisor = Supervisor.new
  end

  def create
    @supervisor = Supervisor.new(supervisor_params)
    if @supervisor.save
      redirect_to @supervisor, notice: 'Supervisor criado com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @supervisor já está definido
  end

  def update
    if @supervisor.update(supervisor_params)
      redirect_to @supervisor, notice: 'Supervisor atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @supervisor.destroy
    redirect_to supervisors_path, notice: 'Supervisor excluído com sucesso.'
  end

  private

  def set_supervisor
    @supervisor = Supervisor.find(params[:id])
  end

  def supervisor_params
    params.require(:supervisor).permit(
      :nome,
      :especialidade,
      :contato,
      :disponibilidade,
      :autismia_id
    )
  end
end