class TrackerSerializer < ActiveModel::Serializer
  attributes :id, :name, :graph
  def graph
    h = object.events
  end
end
