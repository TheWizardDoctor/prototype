module FeaturesHelper

  def features_sorting()
    #this finds the param for feature name and sorts it (feature 1 -> feature 2 -> feature 10 -> feature 12 -> etc)
    if params[:feature_name] == 'ascending'
      @features.sort! {|x,y| x.name[/\d+/].to_i <=> y.name[/\d+/].to_i }
    elsif params[:feature_name] == 'descending'
      @features.sort! {|x,y| y.name[/\d+/].to_i <=> x.name[/\d+/].to_i}
    end
  end

end
