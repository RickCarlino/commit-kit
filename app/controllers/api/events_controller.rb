module Api
  class EventsController < Api::Controller
    def create
      mutate Events::Create.run(tracker: tracker, user: current_user)
    end

    def index
      render json: events
    end

    def destroy
      render nothing: true if event.destroy
    end

private

    def event
      Event.find_by!(user_id: current_user.id, id: params[:id])
    end

    def tracker
      Tracker.find_by!(user_id: current_user.id, id: params[:tracker_id])
    end

    def events
      Event.where(user_id: current_user.id, tracker_id: params[:tracker_id])
    end
  end
end
