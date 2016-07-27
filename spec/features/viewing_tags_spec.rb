feature "for viewing tags" do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tag: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tag: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tag: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tag: [Tag.first_or_create(name: 'bubbles')])
  end


  scenario "I can view a tag" do

    visit '/tags/bubbles'

    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end

  end

end
