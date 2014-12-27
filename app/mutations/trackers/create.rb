module Trackers
  class Create < Mutations::Command
    required do
      model :user, class: User
      string :name
    end

    def execute
      Tracker.create(user: user, name: name)
    end
  end
end
