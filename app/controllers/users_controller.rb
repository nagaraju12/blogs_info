class UsersController < ApplicationController

 def index

    if params[:find_friend_string].present?
      @users = User.where(email: params[:find_friend_string])
    else
      @users = User.includes(:friendships)
    end
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end
def edit 
    @user = User.find(params[:id])
  end
def new
	@user= User.new
	1.times{@user.images.build}
	end

 def create
    @user = User.new(user_params)
    1.times{@user.images.build} if @user.images.blank?
    if @user.save
      
      #flash[:success] = "Welcome to the Sample App!"
      redirect_to users_path
    else
      render 'new'
    end
  end

def destroy

	  @user = User.find(params[:id])

	  @user.destroy
	  redirect_to @user
end

   def user_params
   	params.require(:user).permit!
    end

end
