class CreateFootnotes < ActiveRecord::Migration
  def change
    create_table :footnotes do |t|
      t.string :body
      t.references :section

      t.timestamps null: false
    end
  end
end
