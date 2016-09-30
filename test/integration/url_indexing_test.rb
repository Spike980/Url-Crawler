require 'test_helper'
require 'uri'

class UrlIndexingTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "fetch all the indexed links" do
  	get '/retrieveurl'
  	assert_equal 200, response.status
  	refute_empty response.body
  	index_urls = JSON.parse(response.body, symbolize_names: true)
  	urls = index_urls.collect {|indexed_url| indexed_url[:url]}
  	assert_includes urls, 'http://www.randomwebsite.in/'
  	assert_match "An h1 tag", response.body
  end


  test "should return 422 unprocessed entry error" do
  	get '/indexurl?url=whatever'
  	assert_equal 422, response.status
  end
  

  test "should store the posted data and return the record created" do
  	link = URI.encode('http://koylanchalps.in')
  	assert_difference 'UrlIndex.count' do
	  	get "/indexurl?url=#{link}"
    end
  	assert_equal 201, response.status
  	refute_empty response.body
  end
end
