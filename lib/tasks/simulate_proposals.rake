desc "simulate_proposals"
task :simulate_proposals => :environment do
  systems = System.all.to_a

  System.update_all(nameable: false)
  Planet.update_all(nameable: false)
  systems.sort_by {|i| rand }[0..19].each {|system| system.update_attributes nameable: true}

  ProposalVote.delete_all
  ProposedName.delete_all
  Proposal.delete_all
  Club.delete_all

  2000.times do |club_index|
    club = Club.create! username: Faker::Company.name, email: Faker::Internet.safe_email(club_index)

    system = systems[rand(systems.length)]

    proposal = Proposal.create(club: club, system: system)
    proposal.create_proposed_system_name! name: "Name from club #{club_index}", club: club, nameable_entity: system

    system.planets.each do |planet|
      proposal.proposed_planet_names.create! name: "Planet name from club #{club_index}", club: club, nameable_entity: planet
    end
  end
end
