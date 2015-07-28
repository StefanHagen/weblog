class AddPublishingDates < ActiveRecord::Migration
  def change
    add_column :posts, :published_on, :datetime, :after => :published
    add_column :comments, :published_on, :datetime, :after => :published
    add_column :projects, :published_on, :datetime, :after => :published
  end
end
