class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :type
      t.integer :user_id
      t.integer :story_id
      t.text :description
      t.string :name
      t.string :photo
      t.string :voice

      t.timestamps
    end
  end
end
