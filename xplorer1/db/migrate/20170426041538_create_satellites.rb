class CreateSatellites < ActiveRecord::Migration[5.0]
  def change
    create_table :satellites do |t|
      t.string :name
      t.string :picture
      t.text :description

      t.timestamps
    end
  end
end
