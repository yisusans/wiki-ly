class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :article
      t.references :user
      t.timestamps null: false
    end
  end
end
