class CandidaciesController < ApplicationController
  before_action :set_candidacy, only: [:show, :update, :destroy]
  before_action :authenticate_user!
   # GET /candidacies
  def index
    json = Candidacy.all.map do |candidacy|
      {
        id: candidacy.id,
        workflow_state: candidacy.workflow_state,
          user:
              {
                id: candidacy.user.id,
                first_name: candidacy.user.first_name,
                last_name: candidacy.user.last_name,
              },
          campaign:
              {
                id: candidacy.campaign.id,
                name: candidacy.campaign.name
              }
      }
    end
    render json: json
  end

  # POST /candidacies
  def create
    @candidacy = Candidacy.new
    @user = current_user
    @campaign = set_campaign

    if not @user.candidacies.where(campaign_id: @campaign).exists?
      @candidacy.user = @user
      @candidacy.campaign = @campaign
      @candidacy.workflow_state = "pending"
      @candidacy.save!
      render json: candidacy_json(@candidacy)
    end
  end
  # GET /candidacies/:id

  def show
    render json: candidacy_json(@candidacy)
  end

  # PUT /candidacies/:id
  def update
    result = @candidacy.update!(candidacy_params)
    render json: candidacy_json(@candidacy), status: result ? 200 : 422
  end

  # DELETE /candidacies/:id

  private

  def candidacy_json(candidacy)
    {
        id: candidacy.id,
        workflow_state: candidacy.workflow_state,
          user:
              {
                id: candidacy.user.id,
                first_name: candidacy.user.first_name,
                last_name: candidacy.user.last_name,
              },
          campaign:
              {
                id: candidacy.campaign.id,
                name: candidacy.campaign.name
              }
      }
  end

  def candidacy_params
    # whitelist params
    params.require(:candidacy).permit(:workflow_state)
  end

  def candidacy_params
    # whitelist params
    params.require(:candidacies).permit(:workflow_state)
  end

  def set_candidacy
    @candidacy = Candidacy.find(params[:id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign][:id])
  end
end
