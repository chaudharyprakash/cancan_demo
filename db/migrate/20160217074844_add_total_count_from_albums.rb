class AddTotalCountFromAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :total_count, :integer, :default => 0
  end
end
