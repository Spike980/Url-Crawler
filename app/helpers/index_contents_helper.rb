module IndexContentsHelper
	require 'uri'
	def extract_and_store_content(url)
		require 'open-uri'
		return "error" if !valid?(url)
		
	  	html_doc = Nokogiri::HTML(open(url))
	  	indexed_url = UrlIndex.store_url(url)	

	  	#extract all <h1> tags from document and store contents in database
	  	h1 = html_doc.css('h1')
	  	h1.each do |h1_element|
	  		indexed_url.store_content(h1_element.text, 'h1')
	  	end

	  	#extract all <h2> tags from document and store contents in database
	  	h2 = html_doc.css('h2')
	  	h2.each do |h2_element|
	  		indexed_url.store_content(h2_element.text, 'h2')
	  	end

	  	#extract all <h3> tags from document and store contents in database
	  	h3 = html_doc.css('h3')
	  	h3.each do |h3_element|
	  		indexed_url.store_content(h3_element.text, 'h3')
	  	end


	  	#extract all <a> tags from document and store href in database
	  	links = html_doc.css('a')
	  	links.each do |links_element|
	  		indexed_url.store_content(links_element['href'], 'link')
	  	end
	  	
	  	return indexed_url
    end

=begin
    def store_element_content(elements, elements_name)
	  	elements.each do |element|
	  		@indexed_url.store_content(element.text, element_name)
	  	end
    end
=end
	
	#check validity of url passed in GET request
    def valid?(url)
	  uri = URI.parse(url)
	  uri.kind_of?(URI::HTTP)
	rescue URI::InvalidURIError
	  false
	end


end
