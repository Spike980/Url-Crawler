class ModifyTypeToContentTypeInUtlContents < ActiveRecord::Migration[5.0]
  def change
  	rename_column :url_contents, :type, :content_type
  end
end
