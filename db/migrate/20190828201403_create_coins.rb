class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.string :description
      t.string :aconym
      t.string :url_image

      t.timestamps
    end
  end
end
