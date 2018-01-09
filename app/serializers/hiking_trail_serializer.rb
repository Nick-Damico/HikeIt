class HikingTrailSerializer < ActiveModel::Serializer
  attributes :id, :name, :image_url, :feature
  belongs_to :feature, serializer: FeatureSerializer
end
