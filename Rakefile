require 'resque/tasks'
require 'resque/scheduler/tasks'

require 'yaml'
config = YAML.load_file('config.yml')

namespace :resque do
  task :setup do
    require 'resque'
    require 'job/stats'
    Resque.redis = config['redis']
  end

  task :setup_schedule => :setup do
    require 'resque-scheduler'
    Resque.schedule = YAML.load_file('schedule.yml')
  end

  task :scheduler => :setup_schedule
end

namespace :db do
  task :migrate do |t, args|
    require 'sequel'
    Sequel.extension :migration
    db = Sequel.connect(config['db'])
    Sequel::Migrator.run(db, "db/migrations")
  end
end