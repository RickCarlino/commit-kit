module Api
  class TrackersController < Api::Controller

    def create
      render json: Trackers::Create.run(user: current_user,
                                        name: params[:tracker][:name])
    end

    def index
      render json: Tracker.where(user_id: current_user.id)
    end

    def update
      render json: Trackers::Update.run(update_params)
    end

    def destroy
      render nothing: true if tracker.destroy
    end

private
    def update_params
      {user: current_user,
      tracker: tracker,
      params: params[:tracker]}
    end

    def tracker
      Tracker.find_by!(user_id: current_user.id, id: params[:id])
    end
  end
end
