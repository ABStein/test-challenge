require 'spec_helper'
require 'rails_helper'

describe 'Rocket Miles Search Functionality', :type => :feature do

	before(:each) do
		visit '/'
  	sleep 3
	end

	it 'should search properties and earn rewards' do
		# set city and click on auto complete
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[3]/div/form/div[1]/gofr-location-search/div/input').click
		fill_in 'Where do you need a hotel?', with: 'New York, NY'

		find(:xpath, '/html/body/div[1]/div[4]/div[3]/div/form/div[1]/gofr-location-search/div/div/ul/li[1]').click
		sleep 2

		# set reward prgram and click on auto complete
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[3]/div/form/div[2]/gofr-program-autosuggest/div/input').click
		fill_in 'Select reward program', with: 'Amazon.com Gift Card'
		find(:xpath, '/html/body/div[1]/div[4]/div[3]/div/form/div[2]/gofr-program-autosuggest/div/div/ul/li/a').click

		# search results
		click_button 'Search properties and earn rewards'
	end

	it 'test invalid rewards program given' do
		# set city and click on auto complete
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[3]/div/form/div[1]/gofr-location-search/div/input').click
		fill_in 'Where do you need a hotel?', with: 'New York, NY'
		find(:xpath, '/html/body/div[1]/div[4]/div[3]/div/form/div[1]/gofr-location-search/div/div/ul/li[1]').click

		# search results
		click_button 'Search properties and earn rewards'

		# expect pop up error asking for valid rewards program
		expect(page).to have_xpath('/html/body/div[1]/div[4]/div[3]/div/form/div[2]/gofr-program-autosuggest/div/div[1]/div[2]'), 'Reward program is required.'
	end

	it 'should test invalid location given' do
		# set reward prgram and click on auto complete
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[3]/div/form/div[2]/gofr-program-autosuggest/div/input').click
		fill_in 'Select reward program', with: 'Amazon.com Gift Card'
		find(:xpath, '/html/body/div[1]/div[4]/div[3]/div/form/div[2]/gofr-program-autosuggest/div/div/ul/li/a').click

		# search results
		click_button 'Search properties and earn rewards'

		# expect pop up error asking for valid location
		expect(page).to have_xpath('/html/body/div[1]/div[4]/div[3]/div/form/div[1]/gofr-location-search/div/div[1]/div[2]/div'), 'Unknown location. Please type the city name again slowly and wait for the drop down options, or double-check the spelling.'
	end
	
	it 'should check that the calendar is visible' do
		#click start date
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[3]/div/form/div[4]/div[1]').click
		sleep 2

		# check that calendar is visible
		expect(page).to have_xpath('//*[@id="ui-datepicker-div"]/table')
	end

end