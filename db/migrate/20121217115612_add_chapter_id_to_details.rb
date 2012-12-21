class AddChapterIdToDetails < ActiveRecord::Migration
  def change
    add_column :details, :chapter_id, :integer
  end
end
