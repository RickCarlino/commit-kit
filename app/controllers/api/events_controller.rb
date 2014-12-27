module Api
  class EventsController < Api::Controller
    def create
      mutate Events::Create.run(tracker: tracker, user: current_user)
    end

    def index
      render json: time_series_stuff
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

    def time_series_stuff
      events
      .group_by { |t| t.created_at.midnight.to_i }
      .inject({}) do |accum, (k, v)|
        accum[k] = v.count
        accum
      end
    end
  end
end
