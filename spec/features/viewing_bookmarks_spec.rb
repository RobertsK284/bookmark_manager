feature "viewing bookmarks" do
  scenario 'visiting the index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'visiting the Bookmarks list page' do

    Bookmark.add(url: 'http://www.makersacademy.com')
    Bookmark.add(url: 'http://www.destroyallsoftware.com')
    Bookmark.add(url: 'http://www.google.com')

    visit ('/bookmarks/list')

    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end
