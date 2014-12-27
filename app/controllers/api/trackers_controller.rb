module Api
  class TrackersController < Api::Controller
    def create
      render json: Trackers::Create.run(user: current_user,
                                        name: params[:tracker][:name])
    end

    def index
      render json: Tracker.where(user_id: current_user.id)
    end

  end
end
