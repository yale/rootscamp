class UsersController < ApplicationController
  respond_to :json

  # GET /users.json
  def index
    @users = User.where(updated_at: Time.at(params[:since].to_i)..Time.now)
  end

  # GET /users/1.json
  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render :nothing => true, :status => 404 unless @user
    end
  end

  # POST /users.json
  def create
    @user = User.new(params[:user]) do |u|
      u.id = params[:user][:id] if params[:user][:id]
    end

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
      render json: @user, status: :ok, location: @user
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
