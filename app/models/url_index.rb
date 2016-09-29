class UrlIndex < ApplicationRecord
	has_many :url_contents 
	
	def store_content(content, type)
		@contents = url_contents.create(content: content, content_type: type) 
	end

	def self.store_url(url)
		@url_indexed = self.create(url: url)	
	end

  	def as_json(options = {})
  		super(options.merge(:only => ['url'], :include => [:url_contents => {:only => ['content', 'content_type']}]))
  	end
end
