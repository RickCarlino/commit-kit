class TrackerSerializer < ActiveModel::Serializer
  attributes :id, :name, :graph
  def graph
    h = object.events
    # binding.pry
  end
end
