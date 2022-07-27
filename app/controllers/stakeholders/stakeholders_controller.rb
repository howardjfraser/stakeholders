class Stakeholders::StakeholdersController < ApplicationController
  before_action :set_stakeholder, only: %i[show edit update destroy]

  # GET /stakeholders/1
  def show; end

  # GET /stakeholders/new
  def new
    @stakeholder = Stakeholder.new
  end

  # GET /stakeholders/1/edit
  def edit; end

  # POST /stakeholders
  def create
    @stakeholder = Stakeholder.new(stakeholder_params)

    if @stakeholder.save
      redirect_to @stakeholder, notice: 'Stakeholder was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stakeholders/1
  def update
    if @stakeholder.update(stakeholder_params)
      redirect_to @stakeholder, notice: 'Stakeholder was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /stakeholders/1
  def destroy
    @stakeholder.destroy
    redirect_to stakeholders_url, notice: 'Stakeholder was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stakeholder
    @stakeholder = Stakeholder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stakeholder_params
    params.require(:stakeholder).permit(:name, :party, :faction)
  end
end
