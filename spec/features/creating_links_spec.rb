require 'capybara/rspec'
require './app/models/link'
require './app/app'

feature 'Creating links' do

  scenario 'save a new Link' do
    visit '/links/new_link'
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'www.bbc.com'
    click_button 'Submit'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content "BBC"
    end
  end
end
