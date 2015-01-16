class Project < ActiveRecord::Base

  # Associations
  belongs_to :administrator
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  # Scopes
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }

  # Pagination
  self.per_page = 30
  
end
