require 'spec_helper'

describe 'hit api' do
  it 'should hit the api' do
  	puts "https://api.darksky.net/forecast/#{$DARK_SKY_API_KEY}/41.8756,-87.6244"
  	# puts get "https://api.darksky.net/forecast/#{$DARK_SKY_API_KEY}/41.8756,-87.6244"

    # expect_json(
    # 	latitude: 41.8756
    # )
  end
end