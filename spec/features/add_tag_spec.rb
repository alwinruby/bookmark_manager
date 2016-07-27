feature 'Add tags' do

  scenario 'User can add a new tag to a link' do
    visit '/links/new'

    fill_in 'url', with: 'www.ceramicwarehouse.com'
    fill_in 'title', with: 'pottery'
    fill_in 'tag', with: 'clay'
    click_button 'Create Link'

    expect(current_path).to eq '/links'

    link = Link.first
    expect(link.tag.map(&:name)).to include('clay')

  end

  scenario 'adding more than one tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'www.ceramicwarehouse.com'
    fill_in 'title', with: 'pottery'
    fill_in 'tag', with: 'pots, cracked'
    click_button 'Create Link'
    link = Link.first
    expect(link.tag.map(&:name)).to include('pots, cracked')

  end

end
