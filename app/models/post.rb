class Post < ActiveRecord::Base

  # Associations
  belongs_to :administrator
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings
  has_many :comments, :as => :commentable, :dependent => :destroy

  # Scopes
  scope :current_author, ->(author_id) { where(:administrator_id => author_id)}
  scope :published, -> { where("published = true") }
  scope :recently_created, -> { order("created_at DESC") }
  scope :recently_updated, -> { order("updated_at DESC") }

  # Pagination
  self.per_page = 30

end
