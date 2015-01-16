class Tag < ActiveRecord::Base

  # Associations
  has_many :taggings, :dependent => :destroy
  has_many :posts, :through => :taggings, :source => :taggable, :source_type => "Post"
  has_many :projects, :through => :taggings, :source => :taggable, :source_type => "Project"

end
