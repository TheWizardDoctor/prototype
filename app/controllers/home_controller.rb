class HomeController < ApplicationController
  def index
    @features = Feature.all.paginate(:page => params[:page], :per_page => 30)
    @initiatives = Initiative.all.paginate(:page => params[:page], :per_page => 30)
    @roadmaps = Roadmap.all.paginate(:page => params[:page], :per_page => 30)
    @teams = Team.all.paginate(:page => params[:page], :per_page => 30)
  end
end
