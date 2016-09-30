class IndexContentsController < ApplicationController
 include IndexContentsHelper

  def index
	url = params[:url]
	index_url = extract_and_store_content(url)
	if(index_url == "error") 
		render text: "invalid url", status: 422
	end
	
	if params[:callback]
		#if request is cross-origin 
		render json: index_url, status: 201, :callback => params[:callback]
   	else
		render json: index_url, status: 201
    end
  end

  def fetch
  	#retrieve all existing indexed links and contents with as_json override -- add pagination later
	urls = UrlIndex.all()
		if params[:callback]
			#if request is cross-origin 
			render json: urls, status: 200, :callback => params[:callback]
	   	else
			render json: urls, status: 200
	    end
  end


end
