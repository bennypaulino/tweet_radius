class Tweet
  include Mongoid::Document
  field :hashtags, type: Array, default: []
  field :distance, type: Integer
  field :location, type: Array, default: []
  field :created_at, type: DateTime
  index({ location: "2dsphere" }, { min: -180, max: 180 })
  index({created_at: -1})

  attr_accessible :hashtags, :created_at
  validates_presence_of :distance, :location

  db.articles.ensureIndex({
   "location" : "2dsphere",
   "hashtags": 1
  })
end
