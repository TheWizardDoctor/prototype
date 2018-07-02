module TeamsHelper

  def create_lists(team, quater)
    @investments = {}
    @features = {}
    @initiatives = {}
    @roadmaps = {}
    Investment.where(team_id: team.id).each do |inv|
      if Feature.find(inv.feature_id).quater == quater
        @investments.exclude?(inv) ? i = inv.investment : i = 0
        @investments[inv] = i
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
    end
    @investments = Hash[ @investments.sort_by {|key, val| key}]
    @features = Hash[ @features.sort_by {|key, val| key}]
    @initiatives = Hash[ @initiatives.sort_by {|key, val| key}]
    @roadmaps = Hash[ @roadmaps.sort_by {|key, val| key}]
  end


def sorting()
  @teams = Team.all.compact
  quater = params[:quater]
  quater == nil ? quater = 'Q1' : quater = quater

  if params[:team_investment] == 'ascending'
    team_investments = {}
    @teams.each do |team, value|
      investment_values = 0
      Investment.where(team_id: team.id).each do |i|
        Feature.find(i.feature_id).quater == quater ? investment_values += i.investment : a=0
      end
      team_investments[team.id] = investment_values
    end
    @teams.sort! {|x,y| team_investments[x.id] <=> team_investments[y.id] }

  elsif params[:team_investment] == 'descending'
    team_investments = {}
    @teams.each do |team, value|
      investment_values = 0
      Investment.where(team_id: team.id).each do |i|
        Feature.find(i.feature_id).quater == quater ? investment_values += i.investment : a=0
      end
      team_investments[team.id] = investment_values
    end
    @teams.sort! {|x,y| team_investments[y.id] <=> team_investments[x.id] }
  end

  if params[:team_name] == 'ascending'
    @teams.sort! {|x,y| x.name[/\d+/].to_i <=> y.name[/\d+/].to_i }
  elsif params[:team_name] == 'descending'
    @teams.sort! {|x,y| y.name[/\d+/].to_i <=> x.name[/\d+/].to_i}
  end

  7.times {@teams.each {|team| team_in_quater(team, quater) ?  a=0 : @teams.delete(team)}}

  @teams = @teams.paginate(:page => params[:page], :per_page => 10)
end

def team_in_quater(team, quater)
  Investment.where(team_id: team.id).each do |i|
    if Feature.find(i.feature_id).quater == quater
      return true
    end
  end
  return false
end

end
