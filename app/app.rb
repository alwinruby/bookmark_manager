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
    link = Link.create(url: params[:url],
                title: params[:title])
    params[:tag].split.each do |tag|
      link.tag << Tag.create(name: tag)
    end

    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :'links/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
