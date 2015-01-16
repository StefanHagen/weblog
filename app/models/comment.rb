class Comment < ActiveRecord::Base

  # Associations
  belongs_to :comment
  belongs_to :commentable, :polymorphic => true

  # Scopes
  scope :published, -> { where("published = true") }
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }

  # Pagination
  self.per_page = 30

end
