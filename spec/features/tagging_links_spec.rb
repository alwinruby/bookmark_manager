feature "tagging links" do

  scenario "adds a tag to a link" do
    visit "/links/new"
    fill_in("title", with: "Makers Academy")
    fill_in("url", with: "http://www.makersacademy.com")
    fill_in("tags", with: "education")
    click_button("Submit")

    link = Link.first
    expect(link.tags.map(&:name)).to include("education")

  end

  scenario 'adds multiple tags to a link' do
    visit "/links/new"
    fill_in("title", with: "Makers Academy")
    fill_in("url", with: "http://www.makersacademy.com")
    fill_in("tags", with: 'education coding')
    click_button("Submit")

    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'coding')
  end
end
