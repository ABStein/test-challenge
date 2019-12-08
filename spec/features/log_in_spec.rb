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

		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/div[1]/p'), 'We were not able to find a user with that email and password.'
	end
end