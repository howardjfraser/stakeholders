class Stakeholders::ReportsController < ApplicationController
  def show
    @search = StakeholderSearch.new(retrieve_search_attributes)
    stakeholders = @search.search
    @parties = stakeholders.map(&:party).tally
    @factions = stakeholders.map(&:faction).tally
  end

  def update
    store_search_attributes
    redirect_to reports_url
  end

  private

  def store_search_attributes
    current_user.stakeholder_search.update(**permitted_params.to_hash)
  end

  def retrieve_search_attributes
    current_user.stakeholder_search.to_h
  end

  def permitted_params
    params.require(:search).permit(:terms, :party, :faction, :panel_open)
  end
end
