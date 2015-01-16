class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user
      t.string :email
      t.text :body
      t.references :commentable, :polymorphic => true
      t.boolean :published, :default => true

      t.timestamps
    end
  end
end
