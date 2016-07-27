feature "for creating links" do

  scenario "I can create a link" do

    visit '/links/new'
    fill_in 'url', with: 'http://ello.co'
    fill_in 'title', with: 'For wasting time'
    click_button 'Create Link'
    expect(current_path).to eq '/links'
    within 'ul#links' do
      expect(page).to have_content('For wasting time')
    end

  end

end
