task :load_systems => :environment do
  systems  = {}
  System.destroy_all
  Planet.destroy_all

  File.open("data/PlanetList.csv", "r").read.split("\r\n").each_with_index do |line,index|
    next if index<5
    line = line.split(",")
    next if line.all?{|l| l.empty?}
    next if line[0].include? "exoplanet"
    

    puts line
    # Host Star,# Planet, Planet Mass,Planet Mass, Orbital Period, Semi Major Axis,Discovery,Constellation,Visibility,V magnitude
  #  (catalogue),(designation),(Jupiter mass),(Earth mass),(day),(au),(year),(English),,


    name                     = line[0]
    planet_name              = line[1]
    planet_mass_jup          = line[2]
    planet_mass_earth        = line[3]
    planet_period            = line[4]
    planet_semi_major_axis   = line[5]
    discovery                = line[6]
    constellation            = line[7]
    visibility               = line[8]
    vmag                     = line[9]

    if name.empty?
      name = @last_name
    end
    @last_name = name


    systems[name] ||= {star: {name: name, constellation: constellation, vmag: vmag, visibility: visibility}, planets:[]}
    systems[name][:planets].push({name: planet_name,
                          mass_earth: planet_mass_earth,
                          mass_jup: planet_mass_jup,
                          period: planet_period,
                          semi_major:planet_semi_major_axis,
                          discovery_year: discovery
                        })
  end

  not_nameable_systems = ["Edasich (iota Draconis)", "Errai (gamma Cephei)", "Fomalhaut (alpha Piscis Austrini)", "Pollux (beta Geminorum)"]

  systems.each do |system_name, details|
    star = details[:star]
    s = System.create(star)

    if not_nameable_systems.include? system_name
      s.nameable = false
      s.save
    end

    details[:planets].each do |planet|
      s.planets.create(planet)
    end
  end
end
