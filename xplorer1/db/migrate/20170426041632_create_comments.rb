class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.references :satellite, foreign_key: true

      t.timestamps
    end
  end
end
