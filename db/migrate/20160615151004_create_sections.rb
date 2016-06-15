class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :subtitle
      t.string :body
      t.references :article

      t.timestamps null: false
    end
  end
end
