require 'test_helper'

class UrlIndexTest < ActiveSupport::TestCase

	def setup
		@url_indexed = UrlIndex.new(url: 'http://www.quora.com/')
	end

	test "should be valid" do
	  	assert @url_indexed.valid? 
	end

	test "should not be empty" do
		url_indexed2 = UrlIndex.new(url: '')
	  	assert_not url_indexed2.valid? 
	end

	test "should not be duplicate" do
		url_indexed2 = @url_indexed.dup
		@url_indexed.save
	  	assert_not url_indexed2.valid? 
	end
end
