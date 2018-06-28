# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#here is the full seed (5^4 in tree formation)
#=begin
x = 0
y = 0
z = 0
(1..5).each do |n|
  name  = "Roadmap #{n}"
  description = "This is roadmap #{n}. It should have 5 Initiatives."
  Roadmap.create!(name: name, description: description)
  5.times do |i|
    x += 1
    init = "Initiative #{x}"
    init_desc = "This is Initiative #{x}. It should have 5 features"
    Initiative.create!(name: init, description: init_desc, roadmap_id: n)
    5.times do |j|
      y += 1
      feat = "Feature #{y}"
      feat_desc = "This is Feature #{y}. It should have at least 2 Teams"
      Feature.create!(name: feat, description: feat_desc, initiative_id: x, quater: "Q#{rand(1..4)}")
      2.times do |k|
        z += 1
        team = "Team #{z}"
        team_desc = "This is Team #{z}."
        Team.create!(name: team, description: team_desc)
        Investment.create!(team_id: z, feature_id: y, investment: rand(0..75))
      end
    end
  end
end

totalFeats = Feature.count('id')

(1..Team.count('id')).each do |team|
  Investment.create!(team_id: team, feature_id: rand(1..totalFeats), investment: rand(0..75))
  Investment.create!(team_id: team, feature_id: rand(1..totalFeats), investment: rand(0..75))
end

#=end
=begin
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
    1.times do |j|
      y += 1
      feat = "Feature #{y}"
      feat_desc = "This is Feature #{y}. It should have 5 Teams"
      id_f = x.to_i
      Feature.create!(name: feat, description: feat_desc, initiative_id: id_f)
      1.times do |k|
        z += 1
        team = "Team #{z}"
        team_desc = "This is Team #{z}."
        id_t = y.to_i
        Team.create!(name: team, description: team_desc, feature_id: id_t)
      end
    end
  end
end
=end
