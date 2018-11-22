require 'sinatra/base'
require './lib/Bookmarks.rb'

class Bookmark_Manager < Sinatra::Base
enable :sessions, :method_override

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

delete '/bookmarks/:id' do
  Bookmark.delete(id: params[:id])
  redirect '/bookmarks'
end

get '/bookmarks/:id/edit' do
  @bookmark = Bookmark.find(id: params[:id])
  erb :'bookmarks/edit'
end

patch '/bookmarks/:id' do
  Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
  redirect '/bookmarks'
end

  run! if app_file == $0
end
