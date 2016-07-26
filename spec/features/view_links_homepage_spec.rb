require 'capybara/rspec'
require './app/models/link'

feature 'See list of links' do

  scenario 'on homepage' do
    #Link.create(url: 'http://www.google.com', title: 'Google')
    # Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Link.create(url: 'https://www.ebay.co.uk', title: 'ebay')
    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      # expect(page).to have_content "Google"
      expect(page).to have_content "ebay"
    end
  end
end
