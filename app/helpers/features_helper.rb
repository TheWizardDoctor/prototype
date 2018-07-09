module FeaturesHelper

  def features_sorting()

    if params[:search] != nil
      7.times {search_features(@features, params[:search])}
    end

    #this finds the param for feature name and sorts it (feature 1 -> feature 2 -> feature 10 -> feature 12 -> etc)
    if params[:Name] == 'ascending'
      @features.sort! {|x,y| sorting_function(x.name, y.name) }
    elsif params[:Name] == 'descending'
      @features.sort! {|x,y| sorting_function(y.name, x.name) }
    end

    if params[:Initiative] == 'ascending'
      @features.sort! {|x,y| sorting_function(Initiative.find_by(id: x.initiative_id).name, Initiative.find_by(id: y.initiative_id).name) == 0 ? sorting_function(x.name, y.name) : sorting_function(Initiative.find_by(id: x.initiative_id).name, Initiative.find_by(id: y.initiative_id).name) }
    elsif params[:Initiative] == 'descending'
      @features.sort! {|x,y| sorting_function(Initiative.find_by(id: y.initiative_id).name, Initiative.find_by(id: x.initiative_id).name) == 0 ? sorting_function(x.name, y.name) : sorting_function(Initiative.find_by(id: y.initiative_id).name, Initiative.find_by(id: x.initiative_id).name) }
    end

    if params[:Quater] == 'ascending'
      @features.sort! {|x,y| sorting_function(x.quater, y.quater) == 0 ? sorting_function(x.name, y.name) : sorting_function(x.quater, y.quater) }
    elsif params[:Quater] == 'descending'
      @features.sort! {|x,y| sorting_function(y.quater, x.quater) == 0 ? sorting_function(x.name, y.name) : sorting_function(y.quater, x.quater) }
    end

    @features = @features.paginate(:page => params[:page], :per_page => 30)
  end

  def search_features(features, query)
    query.upcase!
    good_teams = []
    features.each do |feat, value|
      good = false
      fname = feat.name.upcase
      iname = Initiative.find_by(id: feat.initiative_id).name.upcase
      rname = Roadmap.find_by(id: Initiative.find_by(id: feat.initiative_id).roadmap_id).name.upcase
      Investment.where(feature_id: feat.id).each do |inv|
        tname = Team.find_by(id: inv.team_id).name.upcase
        (tname.include? query or fname.include? query or iname.include? query or rname.include? query) ? good = true : a = 0
      end
      good ? good : @features.delete(feat)
    end
  end

end
