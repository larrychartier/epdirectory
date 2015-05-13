class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @homes = Home.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
  end

  def show
  end

  def new
    @home = current_user.homes.build
  end

  def edit
  end

  def create
    @home = current_user.homes.build(home_params)
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
	redirect_to homes_url, notice: 'Home was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find_by(id: params[:id])
      #redirect_to homes_path, notice: "Not authorized to edit this Home" if @home.nil?
    end

    def correct_user
      @pin = current_user.homes.find_by(id: params[:id])
      redirect_to homes_path, notice: "Not authorized to edit this Home" if @home.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
		params.require(:home).permit(:name, :address1, :city, :postalCode, :province, :country, :description, :image)
    end
end
