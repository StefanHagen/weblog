class Post < ActiveRecord::Base

  # Relations
  belongs_to :administrator

  # Pagination
  self.per_page = 30

  # Scopes
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }

end
