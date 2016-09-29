class IndexContentsController < ApplicationController
 include IndexContentsHelper

  def index
	url = params[:url]
	index_url = extract_and_store_content(url)
	if params[:callback]
		render json: index_url, status: 200, :callback => params[:callback]
   	else
		render json: index_url, status: 200
    end
  end

  def fetch
	urls = UrlIndex.all()
		if params[:callback]
			render json: urls, status: 200, :callback => params[:callback]
	   	else
			render json: urls, status: 200
	    end
  end

end
