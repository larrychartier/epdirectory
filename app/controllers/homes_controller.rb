class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  def index
    @homes = Home.all
  end

  def show
  end

  def new
    @home = Home.new
  end

  def edit
  end

  def create
    @home = Home.new(home_params)

	if @home.save
		redirect_to @home, notice: 'Home was successfully created.'
	else
		render action: 'new'
	end
  end

  def update
	if @home.update(home_params)
		redirect_to @home, notice: 'Home was successfully updated.'
	else
		render action: 'edit'
	end
  end

  def destroy
    @home.destroy
	redirect_to homes_url, notice: 'Home was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:name, :address1, :city, :postalCode, :province, :country, :description)
    end
end
