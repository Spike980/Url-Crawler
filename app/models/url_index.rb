class UrlIndex < ApplicationRecord
	before_save { self.url = url.downcase }
	validates :url, presence: true, uniqueness: { case_sensitive: false }
	has_many :url_contents 
	
	def store_content(content, type)
		@contents = url_contents.create(content: content, content_type: type) 
	end

	def self.store_url(url)
		@url_indexed = self.create(url: url)	
	end

	#override as_json() method to include associated url_contents model attributes
  	def as_json(options = {})
  		super(options.merge(:only => ['url'], :include => [:url_contents => {:only => ['content', 'content_type']}]))
  	end
end
