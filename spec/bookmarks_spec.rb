require 'Bookmarks'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
    end
  end

  describe '.add' do
    it "add url to database" do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.add(url: 'http://www.itv.co.uk')

      expect(Bookmark.all).to include('http://www.itv.co.uk')
    end
  end
end
