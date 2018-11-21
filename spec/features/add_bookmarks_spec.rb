feature "adding bookmarks" do
  scenario "to add the bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in 'url', with: 'http://www.bbc.co.uk'
    click_button('Add')

    expect(page).to have_content 'http://www.bbc.co.uk'
  end
end
