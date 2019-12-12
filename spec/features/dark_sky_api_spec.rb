require 'spec_helper'
require 'rails_helper'

describe 'Testing the Dark Sky API' do
  it 'should hit the api and get a 200' do
    api_key = ENV["API_KEY"]
  	get "https://api.darksky.net/forecast/#{api_key}/41.8756,-87.6244"
    expect_json(
    	latitude: 41.8756,
      longitude: -87.6244
    )
    expect_status(200)
  end

  it 'should hit the api with invalid creds' do
    bad_api_key = ENV["BAD_API_KEY"]
    get "https://api.darksky.net/forecast/#{bad_api_key}/41.8756,-87.6244"
    expect_json(
      code: 403,
      error: "permission denied"
      )

    expect_status(403)
  end

  it 'should hit the api with a poorly formatted request' do
    api_key = ENV["API_KEY"]
  	get "https://api.darksky.net/forecast/#{api_key}/482y3bhec"
  	expect_json(
  		code: 400,
  		error: "Poorly formatted request"
  		)

  	expect_status(400)
  end

  it 'should hit the api with a languange parameter' do
    api_key = ENV["API_KEY"]
    get "https://api.darksky.net/forecast/#{api_key}/41.8756,-87.6244?lang=es"
    expect_json(
      latitude: 41.8756,
      longitude: -87.6244
    )

    expect_status(200)
  end

  it 'should hit the api with an improper languange parameter' do
    api_key = ENV["API_KEY"]
    get "https://api.darksky.net/forecast/#{api_key}/41.8756,-87.6244?lang=e"
    expect_json(
      code: 400,
      error: "An invalid lang parameter was provided."
      )

    expect_status(400)
  end
end
