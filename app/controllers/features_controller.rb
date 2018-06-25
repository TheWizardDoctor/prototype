class FeaturesController < ApplicationController
  before_action :set_feature, only: [:show, :edit, :update, :destroy]

  # GET /features
  # GET /features.json
  def index
    @features = Feature.all
  end

  # GET /features/1
  # GET /features/1.json
  def show
  end

  # GET /features/new
  def new
    @feature = Feature.new
  end

  def new_connector
    set_feature
    @connector = Connector.new
  end

  def connector_create
    @connector = Connector.new(connector_params)

    respond_to do |format|
      if @connector.save
        format.html { redirect_to feature_path(@connector.feature_id), notice: 'Team was successfully added.' }
        format.json { render :show, status: :created, location: @connector }
      else
        @feature = Feature.find(@connector.feature_id)
        format.html { render :new_connector}
        format.json { render json: @connector.errors, status: :unprocessable_entity }
      end
    end
  end

  def investment
    $inv = Connector.find(params[:id])
  end

  def investment_update
    respond_to do |format|
      if $inv.update(investment_params)
        format.html { redirect_to feature_path($inv.feature_id), notice: 'Investment was successfully updated.' }
        format.json { render :show, status: :ok, location: root_path }
      else
        format.html { render :investment }
        format.json { render json: $inv.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /features/1/edit
  def edit
  end

  # POST /features
  # POST /features.json
  def create
    @feature = Feature.new(feature_params)

    respond_to do |format|
      if @feature.save
        format.html { redirect_to @feature, notice: 'Feature was successfully created.' }
        format.json { render :show, status: :created, location: @feature }
      else
        format.html { render :new }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @feature.update(feature_params)
        format.html { redirect_to @feature, notice: 'Feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @feature }
      else
        format.html { render :edit }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.json
  def destroy
    @count = Connector.group(:feature_id).count
    raise "Cannot delete Features that have Teams" unless @count[@feature.id] == nil
    @feature.destroy
    respond_to do |format|
      format.html { redirect_to features_url, notice: 'Feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feature_params
      params.require(:feature).permit(:name, :description, :initiative_id, :quater)
    end

    def connector_params
      params.require(:connector).permit(:team_id, :feature_id)
    end

    def investment_params
      params.require(:connector).permit(:investment)
    end

end
