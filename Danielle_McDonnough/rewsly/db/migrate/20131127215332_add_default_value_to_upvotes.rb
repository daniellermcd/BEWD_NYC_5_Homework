class AddDefaultValueToUpvotes < ActiveRecord::Migration
  def up
    change_column :stories, :upvotes, :integer, default: 0
  end

  def down
    change_column :stories, :upvotes, :integer, default: nil
  end
end
