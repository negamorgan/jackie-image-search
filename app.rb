require 'sinatra/base'
require 'pry'
require_relative './config/environment'

module JackieImageSearch
  class App < Sinatra::Base

    get '/' do

      erb :"index.html"
    end

    get '/search' do
      @term = params[:query]

      @search_results = Google::Search::Image.new
      @search_results.query = @term

      erb :"show_results.html"
    end

  end
end
