class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    json = User.all.map do |user|
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
      }
    end
    render json: json
  end

  # POST /users
  # GET /users/:id

  def show
    render json: user_json(@user)
  end

  # PUT /users/:id
  def update
    result = @user.update(user_params)
    render json: user_json(@user), status: result ? 200 : 422
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    json = User.all.map do |user|
      {
        id: user.id,
        first_name: user.first_name,
      }
    end
    render json: json
  end

  private

  def user_json(user)
    {
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      binding.pry
    }
  end

  def user_params
    # whitelist params
    params.permit(:last_name, :nickname)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
