module Events
  class Create < Mutations::Command
    required do
      model :tracker, class: Tracker
      model :user, class: User
    end

    def execute
      Event.create(tracker: tracker, user: user)
    end
  end
end
