class SchoolsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_school, only: %i[show edit update destroy]

  def index
    @schools = School.all
  end

  def show
    # @school já está definido
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to @school, notice: 'Escola criada com sucesso.'
    else
      render :new
    end
  end

  def edit
    # @school já está definido
  end

  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'Escola atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path, notice: 'Escola excluída com sucesso.'
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(
      :nome_escola,
      :endereco,
      :telefone,
      :email,
      :responsavel_escola
    )
  end
end