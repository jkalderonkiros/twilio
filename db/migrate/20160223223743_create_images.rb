class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :contenttype
      t.string :url
      t.references :message, index: true

      t.timestamps null: false
    end
    add_foreign_key :images, :messages
  end
end
