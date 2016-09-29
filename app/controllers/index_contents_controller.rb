class IndexContentsController < ApplicationController
 include IndexContentsHelper

  def index

=begin  	url = params[:url]
=end
	url = "too1"
	index_url = extract_and_store_content(url)
	render json: index_url, status: 200
  end

  def fetch
	urls = UrlIndex.all()
	render json: urls, status: 200
  end

end
