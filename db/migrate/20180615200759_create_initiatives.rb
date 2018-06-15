class CreateInitiatives < ActiveRecord::Migration[5.2]
  def change
    create_table :initiatives do |t|
      t.string :name
      t.text :description
      t.belongs_to :roadmap, foreign_key: true

      t.timestamps
    end
  end
end
