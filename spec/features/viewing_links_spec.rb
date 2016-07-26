feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://workbyben.com', title: 'Work By Ben')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Work By Ben')
    end

  end

end
