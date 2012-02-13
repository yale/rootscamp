class UsersController < ApplicationController
  respond_to :json

  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/friends.json
  def friends
    @user    = User.find(params[:id])
    @friends = @user.friends
  end

  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      head :no_content
    end
  end
end
