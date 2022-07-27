class Stakeholder < ApplicationRecord
  PARTIES = %w[Labor Liberal Greens]
  FACTIONS = %w[Left Centre Right]

  validates :name, presence: true
  validates :party, inclusion: { in: PARTIES }
  validates :faction, inclusion: { in: FACTIONS }
end
