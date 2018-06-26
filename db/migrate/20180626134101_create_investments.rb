class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :feature_id
      t.integer :team_id
      t.integer :investment

      t.timestamps
    end
  end
end
