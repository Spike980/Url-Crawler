class CreateUrlContents < ActiveRecord::Migration[5.0]
  def change
    create_table :url_contents do |t|
      t.text :content
      t.string :type
      t.references :url_index, foreign_key: true

      t.timestamps
    end
  end
end
