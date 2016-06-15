class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :bibliography, null: false
      t.string :state, null: false, default: "unpublished"
      t.integer :writer_id, null: false
      t.references :group, null: false

      t.timestamps null: false
    end
  end
end
