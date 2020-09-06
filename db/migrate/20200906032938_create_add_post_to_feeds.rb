class CreateAddPostToFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :add_post_to_feeds do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
