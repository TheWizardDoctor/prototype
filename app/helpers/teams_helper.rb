module TeamsHelper

# create list forms a set lists of all of the investments, features, initiatives, and roadmaps that a single team is a part of
  def create_lists(team, quater)
    #setting the empty lists
    @investments = {}
    @features = {}
    @initiatives = {}
    @roadmaps = {}
    #finds each investment
    Investment.where(team_id: team.id).each do |inv|
      #determines if the investment is in the selected quarter
      if Feature.find(inv.feature_id).quater == quater
        #adds the investment to the list if its not already in there
        @investments.exclude?(inv) ? i = inv.investment : i = 0
        @investments[inv] = i
        #finds every feature and adds it to the list if its not already in there
        Feature.where(id: inv.feature_id).each do |feat|
          @features.exclude?(feat) ? @features[feat] = i : @features[feat] += i
          #same thing with initiative
          Initiative.where(id: feat.initiative_id).each do |init|
            @initiatives.exclude?(init) ? @initiatives[init] = i : @initiatives[init] += i
            #and with roadmap
            Roadmap.where(id: init.roadmap_id).each do |map|
              @roadmaps.exclude?(map) ? @roadmaps[map] = i : @roadmaps[map] += i
            end
          end
        end
      end
    end
    #unhashes, organizes, and rehashes each of the lists and then saves them as instance variables
    @investments = Hash[ @investments.sort_by {|key, val| key}]
    @features = Hash[ @features.sort_by {|key, val| key}]
    @initiatives = Hash[ @initiatives.sort_by {|key, val| key}]
    @roadmaps = Hash[ @roadmaps.sort_by {|key, val| key}]
  end

#this function is to sort the team index by selecting quater, or organizing by a few filters
def sorting()
  #creates a fresh team compact
  @teams = Team.all.compact
  #makes sure that /a/ quarter is selected
  @quater = params[:quater]
  @quater == nil ? @quater = 'Q1' : @quater = @quater

  #REVIEW this is for clearing the teams not in the quater out of teams. Its done 7 times becuase for some reason it doesnt catch all the teams unless if its repeated
  7.times {@teams.each {|team| team_in_quater(team, @quater) ?  a=0 : @teams.delete(team)}}

  #finding the param that organizes team index by overall investment
  if params[:team_investment] == 'ascending'
    team_investments = find_team_values()
    #sorts the teams hash from lowest to highest
    @teams.sort! {|x,y| team_investments[x.id] <=> team_investments[y.id] }
  #this does the same thing but ends up sorting from highest to lowest
  elsif params[:team_investment] == 'descending'
    team_investments = find_team_values()
    @teams.sort! {|x,y| team_investments[y.id] <=> team_investments[x.id] }
  end

  #this finds the param for team name and sorts it (team 1 -> team 2 -> team 10 -> team 12 -> etc)
  if params[:team_name] == 'ascending'
    @teams.sort! {|x,y| x.name[/\d+/].to_i <=> y.name[/\d+/].to_i }
  elsif params[:team_name] == 'descending'
    @teams.sort! {|x,y| y.name[/\d+/].to_i <=> x.name[/\d+/].to_i}
  end

  #this paginates the teams into 15 per page
  @teams = @teams.paginate(:page => params[:page], :per_page => 15)
end

#this is a simple check on whether or not the team is in the selected quater
def team_in_quater(team, quater)
  Investment.where(team_id: team.id).each do |i|
    if Feature.find(i.feature_id).quater == quater
      return true
    end
  end
  return false
end

#this is for setting the color background of the numbers using bootstrap
def color(value)
  if value > 100
    return 'danger'
  elsif value >= 85
    return 'success'
  else
    return 'white'
  end
end

#this function finds the total investment of a team for that quater
def find_team_values
  #sets the total investments as an empty hash
  team_investments = {}
  #iterates through every team
  @teams.each do |team, value|
    #initializes the value for the team
    investment_values = 0
    #finds every investment for the team
    Investment.where(team_id: team.id).each do |i|
      #only adds the investment if it is in the selected quarter
      Feature.find(i.feature_id).quater == @quater ? investment_values += i.investment : a=0
    end
    team_investments[team.id] = investment_values
  end
  return team_investments
end

end
