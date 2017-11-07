FactoryBot.define do
  factory :hike do
    title "LeConte Mountain Adventure"
    description "If ever there was a classic hike in Great Smoky Mountains National Park, the Alum Cave Trail to Mt. LeConte would certainly qualify. Sure, there are hikes in the Smokies that are far longer, gain more elevation, or have steeper climbs, but the Alum Cave Trail is unmatched in its combination of interesting geological features, history, high adventure and stunning panoramic views."
    hike_date Time.new(3000)
    hike_time nil
    notes "Its going to rain! Bring the right wet weather gear."
    hiking_trail_id nil
  end
end
# 2017-11-07