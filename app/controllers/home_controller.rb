class HomeController < ApplicationController
  def index
    @features = Feature.all
    @initiatives = Initiative.all
    @quaters = Quater.all
    @roadmaps = Roadmap.all
    @teams = Team.all
  end
end
