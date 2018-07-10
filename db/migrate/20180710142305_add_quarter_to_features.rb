class AddQuarterToFeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :features, :quarter, :string
  end
end
