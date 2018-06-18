# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
x = 0
y = 0
z = 0
(1...6).each do |n|
  name  = "Roadmap #{n}"
  description = "This is roadmap #{n}. It should have 5 Initiatives."
  Roadmap.create!(name: name, description: description)
  5.times do |i|
    x += 1
    init = "Initiative #{x}"
    init_desc = "This is Initiative #{x}. It should have 5 features"
    id_i = n.to_i
    Initiative.create!(name: init, description: init_desc, roadmap_id: id_i)
    5.times do |j|
      y += 1
      feat = "Feature #{y}"
      feat_desc = "This is Feature #{y}. It should have 5 Teams"
      id_f = x.to_i
      Feature.create!(name: feat, description: feat_desc, initiative_id: id_f)
      5.times do |k|
        z += 1
        team = "Team #{z}"
        team_desc = "This is Team #{z}."
        id_t = y.to_i
        Team.create!(name: team, description: team_desc, feature_id: id_t)
      end
    end
  end
end
