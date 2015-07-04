desc "simulate_proposals"
task :simulate_proposals => :environment do
  systems = System.all.to_a

  System.update_all(nameable: false)
  Planet.update_all(nameable: false)
  systems.sort_by {|i| rand }[0..19].each {|system| system.update_attributes nameable: true}

  Club.delete_all
  ProposedName.delete_all

  500.times do |club_index|
    club = Club.create! username: "Club #{club_index}", email: "club#{club_index}@example.com"

    system_voted_on = systems[rand(systems.length)]
    system_voted_on.proposed_names.create! name: "Name from club #{club_index}", club: club
    system_voted_on.planets.each do |planet|
      planet.proposed_names.create! name: "Planet name from club #{club_index}", club: club
    end
  end
end
