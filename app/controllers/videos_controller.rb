require 'algoliasearch'
require 'rubygems'

class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def show
    @video = Video.find(params[:id])
  end

  client = Algolia::Client.new(
    application_id: 'S5LZADTMZI',
    api_key: '9f1f1f7234a20e90fe8f06b515820fa1')


    index = client.init_index('contacts')
    batch = JSON.parse(File.read('contacts.json'))
    index.add_objects(batch)
end
