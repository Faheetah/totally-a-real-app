require 'sinatra'
require 'sequel'
require 'resque'
require 'yaml'
require 'json'

config = YAML.load_file('config.yml')
DB = Sequel.connect(config['db'])

get '/' do
  File.read(File.join('public', 'index.html'))
end

get '/stats' do
  stats = DB[:stats] 
  stats.order(:id).reverse.limit(20).all.to_json
end