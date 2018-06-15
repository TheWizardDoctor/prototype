class CreateFeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :features do |t|
      t.string :name
      t.text :description
      t.belongs_to :initiative, foreign_key: true

      t.timestamps
    end
  end
end
