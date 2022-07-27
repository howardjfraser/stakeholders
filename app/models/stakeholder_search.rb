class StakeholderSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :terms, :string
  attribute :party, array: true
  attribute :faction, array: true
  attribute :panel_open, :boolean

  def search
    result = Stakeholder.all
    result = result.where('lower(name) LIKE ?', "%#{terms.downcase}%") if terms.present?
    result = result.where(party: party) if party&.any?
    result = result.where(faction: faction) if faction&.any?
    result.sort_by(&:name)
  end

  def any_filters?
    party.present? || faction.present?
  end
end
