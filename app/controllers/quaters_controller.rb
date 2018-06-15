class QuatersController < ApplicationController
  before_action :set_quater, only: [:show, :edit, :update, :destroy]

  # GET /quaters
  # GET /quaters.json
  def index
    @quaters = Quater.all
  end

  # GET /quaters/1
  # GET /quaters/1.json
  def show
  end

  # GET /quaters/new
  def new
    @quater = Quater.new
  end

  # GET /quaters/1/edit
  def edit
  end

  # POST /quaters
  # POST /quaters.json
  def create
    @quater = Quater.new(quater_params)

    respond_to do |format|
      if @quater.save
        format.html { redirect_to @quater, notice: 'Quater was successfully created.' }
        format.json { render :show, status: :created, location: @quater }
      else
        format.html { render :new }
        format.json { render json: @quater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quaters/1
  # PATCH/PUT /quaters/1.json
  def update
    respond_to do |format|
      if @quater.update(quater_params)
        format.html { redirect_to @quater, notice: 'Quater was successfully updated.' }
        format.json { render :show, status: :ok, location: @quater }
      else
        format.html { render :edit }
        format.json { render json: @quater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quaters/1
  # DELETE /quaters/1.json
  def destroy
    @quater.destroy
    respond_to do |format|
      format.html { redirect_to quaters_url, notice: 'Quater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quater
      @quater = Quater.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quater_params
      params.require(:quater).permit(:name)
    end
end
