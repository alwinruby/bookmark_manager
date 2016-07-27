ENV['RACK_ENV'] ||= 'development'
# Specificies to set RACK_ENV to developemnt when run loccally

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url],
                title: params[:title])
    tag = Tag.first_or_create(name: params[:tag])
    link.tag << tag
    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :'links/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
