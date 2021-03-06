require 'sinatra/base'
require './lib/Bookmarks.rb'
require './database_connection_setup'
require 'uri'
require 'sinatra/flash'

class Bookmark_Manager < Sinatra::Base
enable :sessions, :method_override
register Sinatra::Flash

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
  flash[:notice] = "You must submit a valid URL" unless Bookmark.add(url: params[:url], title: params[:title])
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
