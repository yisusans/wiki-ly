class CreateEdits < ActiveRecord::Migration
  def change
    create_table :edits do |t|
      t.string :revision
      t.integer :editor_id
      t.references :article
      t.references  :section

      t.timestamps null: false
    end
  end
end
