class Api::Controller < ActionController::Base
  protect_from_forgery with: :null_session
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
