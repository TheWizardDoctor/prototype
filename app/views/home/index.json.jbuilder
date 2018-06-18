json.array! @features, partial: 'features/feature', as: :feature
json.array! @initiatives, partial: 'initiatives/initiative', as: :initiative
json.array! @roadmaps, partial: 'roadmaps/roadmap', as: :roadmap
json.array! @teams, partial: 'teams/team', as: :team
