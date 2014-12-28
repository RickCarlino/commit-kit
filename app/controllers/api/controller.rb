class Api::Controller < ActionController::Base
  skip_before_filter :verify_authenticity_token
  respond_to :json
  before_action :authenticate_user!
private
  def mutate(outcome)
    if outcome.success?
      render json: outcome.result
    else
      render json: outcome.errors.message, status: 422
    end
  end
end
