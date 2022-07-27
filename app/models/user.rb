class User < ApplicationRecord
  kredis_hash :stakeholder_search
  kredis_list :parties
  kredis_list :factions
end
