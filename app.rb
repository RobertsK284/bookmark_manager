require 'sinatra/base'
require './lib/Bookmarks.rb'

class Bookmark_Manager < Sinatra::Base

get '/' do
  erb(:index)
end

get '/bookmarks/list' do
  @bookmarks = Bookmark.all
  erb(:"bookmarks/list")
end

get '/bookmarks/new' do
  erb(:"bookmarks/new")
end

post '/bookmarks' do
  p "Form data submitted to the /bookmarks route!"
  Bookmark.add(url: params[:url])
  redirect '/bookmarks/list'
end


  run! if app_file == $0
end
