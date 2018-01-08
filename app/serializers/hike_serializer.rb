class HikeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :hike_date
  belongs_to :hiking_trail, serializer: HikingTrailSerializer
  has_many :planned_hikes, serializer: PlannedHikeSerializer
end
