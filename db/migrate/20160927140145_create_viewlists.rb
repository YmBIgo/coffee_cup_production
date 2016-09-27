class CreateViewlists < ActiveRecord::Migration
  def change
    create_table :viewlists do |t|

      t.string  :lang, default: "ja"
      t.string  :page_type, default: "unknown"
      t.string  :page_id
      t.integer :user_id
      t.timestamps null: false

    end
  end
end
