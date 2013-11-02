class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.belongs_to :user
      t.belongs_to :story

      t.timestamps
    end
  end
end
