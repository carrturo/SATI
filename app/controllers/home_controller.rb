class HomeController < ApplicationController
  before_action :admin_signed_in, only: [:sign_up_new_user, :create_user]
  
  def index
    @navbar = true;
    @news= News.all
  end
  
  def sign_up_new_user
    @user = User.new
  end
  
  def create_user
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'User was created successfully.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :sign_up_new_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
  end
end
