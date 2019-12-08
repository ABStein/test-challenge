describe 'Rocket Miles Log In Functionality', :type => :feature do
	before(:each) do
		visit '/'
  	sleep 3
	end	

	it 'should test that username and password are not valid' do
		find(:xpath, '//*[@id="rm3-home-page"]/div[1]/div[4]/div[1]/div/div[4]/a').click

		fill_in 'Your Email Address', with: 'andrewstein.career@gmail.com'

		fill_in 'Password', with: '2School4Kewl!'

		click_button 'Sign In'

		expect(page).to have_xpath('//*[@id="rm3-home-page"]/div[1]/div/div/div[2]/form/div[1]/p'), 'We were not able to find a user with that email and password.'
	end
end