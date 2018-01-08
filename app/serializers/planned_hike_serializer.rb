class PlannedHikeSerializer < ActiveModel::Serializer
  attributes :id, :hike_type, :user_id
end
