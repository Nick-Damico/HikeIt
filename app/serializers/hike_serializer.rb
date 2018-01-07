class HikeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :hike_date
end
