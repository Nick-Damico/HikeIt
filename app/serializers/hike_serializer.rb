class HikeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :hike_date, :hike_time, :notes
  belongs_to :hiking_trail, serializer: HikingTrailSerializer
  has_many :planned_hikes, serializer: PlannedHikeSerializer
  has_many :users, serializer: UserSerializer
end
