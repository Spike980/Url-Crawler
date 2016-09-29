module IndexContentsHelper
	def extract_and_store_content(url)
	  	html_doc = Nokogiri::HTML("<html><body><h1>Mr. Belvedere Fan Club</h1></body></html>")
	  	indexed_url = UrlIndex.store_url(url)	

	  	h1 = html_doc.css('h1')
	  	h1.each do |h1_element|
	  		indexed_url.store_content(h1_element.text, 'h1')
	  	end

	  	h2 = html_doc.css('h2')
	  	h2.each do |h2_element|
	  		indexed_url.store_content(h2_element.text, 'h2')
	  	end

	  	h3 = html_doc.css('h3')
	  	h3.each do |h3_element|
	  		indexed_url.store_content(h3_element.text, 'h3')
	  	end

	  	h3 = html_doc.css('h3')
	  	h3.each do |h3_element|
	  		indexed_url.store_content(h3_element.text, 'h3')
	  	end

	  	links = html_doc.css('a')
	  	links.each do |links_element|
	  		indexed_url.store_content(links_element.href, 'link')
	  	end
	  	return indexed_url
    end


end
