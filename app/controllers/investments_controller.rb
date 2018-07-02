class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  # GET /investments
  # GET /investments.json
  def index
    @investments = Investment.all.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
  end

  # GET /investments/new
  def new
    @feature = Feature.find(params[:id])
    if @investment == nil
      @investment = Investment.new #this is for the redirect if there is an error
    end
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = Investment.new(investment_params)
    @feature = Feature.find(@investment.feature_id) #feature is needed for the redirection

    respond_to do |format|
      if @investment.save
        format.html { redirect_to @feature, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: @investment }
      else
        errors = add_errors
        format.html { redirect_to new_investment_path(@feature, :errors => errors) }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investments/1
  # PATCH/PUT /investments/1.json
  def update
    respond_to do |format|
      @feature = Feature.find(@investment.feature_id) #feature is needed for the redirect
      if @investment.update(investment_params)
        format.html { redirect_to @feature, notice: 'Investment was successfully updated.' }
        format.json { render @investment, status: :ok, location: @investment }
      else
        errors = add_errors
        format.html { redirect_to edit_investment_path(@investment, :errors => errors) }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    @investment.destroy
    respond_to do |format|
      format.html { redirect_to feature_path(@investment.feature_id), notice: 'Investment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:feature_id, :team_id, :investment)
    end

    def add_errors
      errors = []
      @investment.errors.full_messages.each do |message|
        errors.push(message)
      end
      return errors
    end
end
