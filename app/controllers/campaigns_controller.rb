class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :update, :destroy]


  # GET /campaigns
  def index
    json = Campaign.all.map do |campaign|
      {
        id: campaign.id,
        name: campaign.name,
        public_description: campaign.public_description,
        is_public: campaign.is_public
      }
    end
    render json: json
  end

  # POST /campaigns
  def create
    campaign = Campaign.new(campaign_params)
    result = campaign.save
    render json: campaign_json(campaign), status: result ? 200 : 422
  end

  # GET /campaigns/:id
  def show
    render json: campaign_json(@campaign)
  end

  # PUT /campaigns/:id
  def update
    result = @campaign.update(campaign_params)
    render json: campaign_json(@campaign), status: result ? 200 : 422
  end

  # DELETE /campaigns/:id
  def destroy
    @campaign.destroy
    json = Campaign.all.map do |campaign|
      {
        id: campaign.id,
        name: campaign.name,
        public_description: campaign.public_description,
        is_public: campaign.is_public
      }
    end
    render json: json
  end

  private

  def campaign_json(campaign)
    {
      id: campaign.id,
      name: campaign.name,
      public_description: campaign.public_description,
      is_public: campaign.is_public
    }
  end

  def campaign_params
    # whitelist params
    params.permit(:last_name, :public_description, :is_public, :nickname)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
