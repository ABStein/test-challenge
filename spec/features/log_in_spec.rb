describe 'Rocket Miles Log In Functionality', :type => :feature do
	before(:each) do
		visit '/'
  	sleep 3
	end	

	it 'should test that username and password are valid' do
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a').click

		fill_in 'Your Email Address', with: ENV["VALID_EMAIL"]

		fill_in 'Password', with: ENV["VALID_PW"]

		click_button 'Sign In'
	end

	it 'should test that username and password are not valid' do
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a').click

		fill_in 'Your Email Address', with: ENV["INVLAID_EMAIL"]

		fill_in 'Password', with: ENV["INVALID_PW"]

		click_button 'Sign In'

		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/div[1]/p'), 'We were not able to find a user with that email and password.'

		click_button 'Sign Up'
	end

	it 'should test sign up button works and shows correct fields' do
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a').click

		click_button 'Sign Up'

		# Your Email Address
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/input[1]')
		# Create new Rcoketmiles password
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[1]')
		# Confirm password
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[2]')
		# First Name
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[3]')
		# Last Name
		expect(page).to have_xpath('/html/body/div[1]/div/div/div[2]/form/div[1]/input[4]')
	end
end