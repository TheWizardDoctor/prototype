module FeaturesHelper

  def features_sorting()

    if params[:search]
      @features = Feature.search(params[:search]).compact
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

end
