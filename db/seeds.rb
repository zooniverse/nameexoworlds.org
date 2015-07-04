# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  10.times do |system_index|
    system = System.create! name: "Core Sys #{system_index}", mass: rand * 1000, vmag: rand * 10

    rand(5).times do |planet_index|
      planet = system.planets.create! name: "Planet #{planet_index}",
                                      mass_jup: rand * 1000,
                                      mass_earth: rand * 10000,
                                      semi_major: rand * 1000,
                                      period: rand * 1000

      rand(10).times do |name_index|
        planet.proposed_names.create! name: "Name for #{planet_index}: #{name_index}"
      end
    end
  end
end
