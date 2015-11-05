class GnarliesController < ApplicationController
  before_action :authenticate,      only: [:create, :destroy]
  before_action :authorize_create,  only: [:create]

  def index
    @gnarlies = Gnarly.all
  end
  def new
    @gnarlie = Gnarly.new
  end

  def show
    @gnarlie = Gnarly.find(params[:id])
  end

  # nested route /users/:user_id/gnarlies
  def create
    @gnarlie = Gnarly.new(gnarlie_params)
    @gnarlie.user = current_user

    if @gnarlie.save
      flash[:notice] = "You're freakin Gnarly!"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def destroy
    gnarly = Gnarly.find(params[:id])
    gnarly.destroy
    redirect_to user_path(current_user)
  end

  private

    def gnarlie_params
      params.require(:gnarly).permit(:text, :image_uri)
    end

    def authenticate
      redirect_to new_session_path, alert: 'You must be logged in to continue!' if current_user.nil?
    end

    # nested route /users/:id/gnarlies
def authorize_create
      @user = User.find(session[:user_id])
      redirect_to root_path if @user != current_user
    end

    def authorize_destroy
      @gnarlie = Gnarly.find(params[:id])
      redirect_to root_path if @mumble.user != current_user
    end
end
