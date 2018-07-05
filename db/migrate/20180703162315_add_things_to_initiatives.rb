class AddThingsToInitiatives < ActiveRecord::Migration[5.2]
  def change
    add_column :initiatives, :percentage, :int
    add_column :initiatives, :estimated_teams, :int
    add_column :initiatives, :key_strategey, :string
    add_column :initiatives, :product_manager, :string
  end
end
