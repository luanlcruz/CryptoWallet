class CreateMiningTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :mining_types do |t|
      t.string :description
      t.string :aconym

      t.timestamps
    end
  end
end
