class StakeholderSearch
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :terms, :string
  attribute :party, :string
  attribute :faction, :string

  def search
    result = Stakeholder.all
    result = result.where('lower(name) LIKE ?', "%#{terms.downcase}%") if terms.present?
    result = result.where('party = ?', party)  if party.present?
    result = result.where('faction = ?', faction)  if faction.present?
    result.sort_by(&:name)
  end

  def any?
    terms.present? || party.present? || faction.present?
  end
end
