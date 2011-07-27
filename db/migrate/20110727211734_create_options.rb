class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :title
      t.string :link
      t.string :description
      t.string :pubdate
      t.string :guid
      t.string :author
      t.string :installUrl
      t.string :sourceUrl

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
