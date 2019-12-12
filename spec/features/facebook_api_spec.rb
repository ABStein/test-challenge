require 'spec_helper'
require 'rails_helper'

describe 'Testing a Facebook API' do
  it 'should hit the api and get back full name with id' do
    facebook_api_key = ENV["FACEBOOK_ACCESS_TOKEN"]

    get "https://graph.facebook.com/v5.0/me?fields=id%2Cfirst_name%2Clast_name&access_token=#{facebook_api_key}"

    expect_json(
      id: "10162770320265438",
      first_name: "Avrumi",
      last_name: "Stein"
      )

    expect_status(200)
  end

  it 'should hit the api with improper creds' do
    bad_facebook_api_key = ENV["BAD_FACEBOOK_ACCESS_TOKEN"]

    get "https://graph.facebook.com/v5.0/me?fields=id%2Cfirst_name%2Clast_name&access_token=#{bad_facebook_api_key}"

    expect_json(
         error: {
            message: "The access token could not be decrypted",
            type: "OAuthException",
            code: 190
         }
    )

    expect_status(400)
  end

  it 'should hit the api with an improper field name' do
    facebook_api_key = ENV["FACEBOOK_ACCESS_TOKEN"]

    get "https://graph.facebook.com/v5.0/me?fields=id%2Cfirst_na%2Clast_name&access_token=#{facebook_api_key}"

    expect_json(
      "error": {
         "message": "(#100) Tried accessing nonexisting field (first_na) on node type (User)",
         "type": "OAuthException",
         "code": 100,
      }
    )

    expect_status(400)
  end
end