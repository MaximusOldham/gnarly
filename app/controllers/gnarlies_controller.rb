class GnarliesController < ApplicationController
  before_action :authenticate,      only: [:create, :destroy]
  before_action :authorize_create,  only: [:create]
  before_action :authorize_destroy, only: [:destroy]

  def index
    @gnarlies = Gnarlie.all.sort_by {|gnarlie| gnarlie.created_at}.reverse
  end
  def new
    @gnarlie = Gnarlie.new
  end

  def show
    @gnarlie = Gnarlie.find(params[:id])
  end

  # nested route /users/:user_id/gnarlies
  def create
    @gnarlie = Gnarlie.new(gnarlie_params)
    @gnarlies.user = current_user

    if @gnarlies.save
      flash[:notice] = "You're freakin Gnarly!"
      redirect_to user_path(current_user)
    else
      render 'new'
    #   if params[:redirect]
    #     redirect_to params[:redirect]
    #   else
    #     redirect_to gnarly_path(@gnarlie)
    #   end
    # else
    #   render :"users/show"
    end
  end

  def destroy
    @gnarlie.destroy
    redirect_to user_path(current_user)
  end

  private

    def gnarlie_params
      params.require(:gnarlie).permit(:text, :image_uri)
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
      @gnarlie = Gnarlie.find(params[:id])
      redirect_to root_path if @mumble.user != current_user
    end
end
