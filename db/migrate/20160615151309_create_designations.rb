class CreateDesignations < ActiveRecord::Migration
  def change
    create_table :designations do |t|
      t.references :tag
      t.references :article

      t.timestamps null: false
    end
  end
end
