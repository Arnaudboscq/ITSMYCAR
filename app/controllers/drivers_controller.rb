class DriversController < ApplicationController
   before_action :set_driver, only: [:show, :update, :destroy]

  # GET /drivers
  def index
    json = Driver.all.map do |driver|
      {
        id: driver.id,
        description: driver.description,
          user:
              {
                id: driver.user.id,
                first_name: driver.user.first_name,
                last_name: driver.user.last_name,
              }
      }
    end
    render json: json
  end

  # POST /drivers
  # GET /drivers/:id

  def show
    render json: driver_json(@driver)
  end

  # PUT /drivers/:id
  def update
    result = @driver.update!(driver_params)
    unless params[:users].nil?
      @driver.user.update!(user_params)
    end


    render json: driver_json(@driver), status: result ? 200 : 422
  end

  # DELETE /drivers/:id

  private

  def driver_json(driver)
    driver = Driver.find(params[:id])
    {
      id: driver.id,
      description: driver.description,
        user:
            {
              id: driver.user.id,
              first_name: driver.user.first_name,
              last_name: driver.user.last_name,
            }
    }
  end

  def driver_params
    # whitelist params
    params.require(:driver).permit(:description)
  end

  def user_params
    # whitelist params
    params.require(:users).permit(:last_name)
  end

  def set_driver
    @driver = Driver.find(params[:id])
  end
end
