class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:quiz_id]
      users = User.where(role: "student")
      @users = []
      user.each do |u|
        if Result.where(user_id: u.id, quiz_id: params[:quiz_id]).size > 0
          @users << u
        end
      end
    elsif params[:role] == "student"
      @users = User.where(role: "student")
    else
      @users = User.all
    end
    
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    head :no_content
  end

  #GET /login
  def login
    @user = User.where({user_name: params[:user_name], password: params[:password]})
    render json: @user.first, status: 200, location: @user.first
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_name, :password, :role)
    end
end
