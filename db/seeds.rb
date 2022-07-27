User.destroy_all
Stakeholder.destroy_all

16.times do
  name = "#{Faker::Name.first_name} #{Faker::Name.unique.last_name}"
  party = Stakeholder::PARTIES.sample
  faction = Stakeholder::FACTIONS.sample
  Stakeholder.create! name: name, party: party, faction: faction
end

User.create! name: 'howard'
