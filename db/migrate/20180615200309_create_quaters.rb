class CreateQuaters < ActiveRecord::Migration[5.2]
  def change
    create_table :quaters do |t|
      t.string :name

      t.timestamps
    end
  end
end
