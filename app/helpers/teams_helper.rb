module TeamsHelper

  def create_lists(team)
    @investments = {}
    @features = {}
    @initiatives = {}
    @roadmaps = {}
    Investment.where(team_id: team.id).each do |inv|
      @investments.exclude?(inv) ? @investments[inv] = inv.investment : a=0
      i = inv.investment
      Feature.where(id: inv.feature_id).each do |feat|
        @features.exclude?(feat) ? @features[feat] = i : @features[feat] += i
        Initiative.where(id: feat.initiative_id).each do |init|
          @initiatives.exclude?(init) ? @initiatives[init] = i : @initiatives[init] += i
          Roadmap.where(id: init.roadmap_id).each do |map|
            @roadmaps.exclude?(map) ? @roadmaps[map] = i : @roadmaps[map] += i
          end
        end
      end
    end
    @investments = Hash[ @investments.sort_by {|key, val| key}]
    @features = Hash[ @features.sort_by {|key, val| key}]
    @initiatives = Hash[ @initiatives.sort_by {|key, val| key}]
    @roadmaps = Hash[ @roadmaps.sort_by {|key, val| key}]
  end

end
