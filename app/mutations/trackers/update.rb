module Trackers
  class Update < Mutations::Command
    required do
      model :user, class: User
      model :tracker, class: Tracker
      hash :params do
        required do
          string :name
        end
      end
    end

    def execute
      tracker.update_attributes(params)
    end
  end
end
