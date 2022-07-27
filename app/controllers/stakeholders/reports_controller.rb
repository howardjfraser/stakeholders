class Stakeholders::ReportsController < ApplicationController
  def show
    create_report
  end

  def update
    store_search_params
    create_report
    render :show
  end

  private

  def store_search_params
    current_user.stakeholder_search.update(**permitted_params.to_hash)
  end

  def retrieve_search_params
    current_user.stakeholder_search.to_h
  end

  def permitted_params
    params.require(:search).permit(:terms, :party, :faction, :panel_open)
  end

  def create_report
    @search = StakeholderSearch.new(retrieve_search_params)
    stakeholders = @search.search
    @parties = stakeholders.map(&:party).tally
    @factions = stakeholders.map(&:faction).tally
  end
end
