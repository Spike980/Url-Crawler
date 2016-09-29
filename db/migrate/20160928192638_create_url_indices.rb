class CreateUrlIndices < ActiveRecord::Migration[5.0]
  def change
    create_table :url_indices do |t|
      t.string :url

      t.timestamps
    end
  end
end
