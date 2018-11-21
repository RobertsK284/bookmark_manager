require 'sinatra/base'
require './lib/Bookmarks.rb'

class Bookmark_Manager < Sinatra::Base

get '/' do
  redirect '/bookmarks'
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb(:"bookmarks/index")
end

get '/bookmarks/new' do
  erb(:"bookmarks/new")
end

post '/bookmarks' do
  p "Form data submitted to the /bookmarks route!"
  Bookmark.add(url: params[:url], title: params[:title])
  redirect '/bookmarks'
end

  run! if app_file == $0
end
