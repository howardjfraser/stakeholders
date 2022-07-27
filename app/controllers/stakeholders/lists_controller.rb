class Stakeholders::ListsController < ApplicationController
  def show
    create_list
  end

  def update
    store_search_params
    create_list
    sleep 0.5 # simulate slower server
    render :show
  end

  private

  def store_search_params
    current_user.stakeholder_search.update(**{ terms: permitted_params[:terms], panel_open: permitted_params[:panel_open] })
    current_user.parties.clear
    current_user.parties.append(permitted_params[:party].select!(&:present?))
    current_user.factions.clear
    current_user.factions.append(permitted_params[:faction].select!(&:present?))
  end

  def retrieve_search_params
    current_user.stakeholder_search.to_h
  end

  def permitted_params
    params.require(:search).permit(:terms, :panel_open, party: [], faction: [])
  end

  def create_list
    @search = StakeholderSearch.new(retrieve_search_params)
    @search.party = current_user.parties.to_a
    @search.faction = current_user.factions.to_a
    @stakeholders = @search.search
  end
end
