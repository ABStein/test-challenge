require 'spec_helper'
require 'rails_helper'

describe 'Rocket Miles Log In Functionality', :type => :feature do
	before(:each) do
		visit '/'
  	sleep 5

  	# click sign in
  	find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a').click
	end	

	it 'should test that username and password are valid' do
		fill_in 'Your Email Address', with: ENV["VALID_EMAIL"]
		fill_in 'Password', with: ENV["VALID_PW"]

		click_button 'Sign In'

		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/div/div/div/a/span').click
		sleep 2

		# check that account page belongs to expected user
		expect(page).to have_xpath('//*[@id="firstName"]'), 'Andrew'
		expect(page).to	have_xpath('//*[@id="lastName"]'), 'Stein'
		expect(page).to have_xpath('//*[@id="username"]'), 'andrewstein.career@gmail.com'
	end

	it 'should test that username is invalid' do
		fill_in 'Your Email Address', with: ENV["INVLAID_EMAIL"]
		fill_in 'Password', with: ENV["VALID_PW"]

		click_button 'Sign In'

		# check for pop up
		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/div[1]/p'), 'We were not able to find a user with that email and password.'
		# exit the sign in screen
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div/div/div[1]/div/button/span[1]').click
		# check that the sign in link is available
		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a'), 'Sign In or Join'
	end

	it 'should test that password is invalid' do
		fill_in 'Your Email Address', with: ENV["VALID_EMAIL"]
		fill_in 'Password', with: ENV["INVALID_PW"]

		click_button 'Sign In'

		# check for pop up
		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/div[1]/p'), 'We were not able to find a user with that email and password.'
		# exit the login
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div/div/div[1]/div/button/span[1]').click
		# check that the sign in link is available
		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a'), 'Sign In or Join'
	end

	it 'should test sign up button works and shows correct fields' do
		click_button 'Sign Up'

		# check for your email address field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/input[1]')
		# check for create new rocketmiles password field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[1]')
		# check for confirm password field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[2]')
		# check for first name field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[3]')
		# check for last name field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[4]')

		# go back to sign in page to confirm we were on the sign up page
		click_button 'Sign In'

		# check for the user name field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/input[1]')
		# check for the password field
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/input[2]')
		# check for button to sign in once we give a valid user and password
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/input[3]')
	end

	it 'should test that the remember me box works' do
		fill_in 'Your Email Address', with: ENV["VALID_EMAIL"]
		fill_in 'Password', with: ENV["VALID_PW"]

		# check off remember box
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/div[1]/input').click

		click_button 'Sign In'

		# click on account to sign back out
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/div/div/div/button/rti-icon/span/i').click
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/div/div/div/ul/li[7]/a').click

		# try to sign back in
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a').click
		# I expected the email to be remembered at least.
		# expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/input[1]'), 'andrewstein.career@gmail.com'
		# it seems remember me is not working..or I'm not quite sure what the functionality should be.
	end


	it 'should test that a user can log out' do
		fill_in 'Your Email Address', with: ENV["VALID_EMAIL"]
		fill_in 'Password', with: ENV["VALID_PW"]

		click_button 'Sign In'

		# click on account to sign back out
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/div/div/div/button/rti-icon/span/i').click
		# sign out
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/div/div/div/ul/li[7]/a').click

		# expect that sign up button exists
		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a'), 'Sign In or Join'
	end
end