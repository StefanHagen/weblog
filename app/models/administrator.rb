class Administrator < ActiveRecord::Base

  # Relations
  has_many :posts

  # Bcrypt password functionality
  has_secure_password

  # Pagination
  self.per_page = 30

  # Scopes
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }

end
