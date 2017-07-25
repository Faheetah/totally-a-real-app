require 'sequel'
require 'yaml'

config = YAML.load_file('config.yml')
DB = Sequel.connect(config['db'])

class Stats
  @queue = :stats

  def self.perform
    uptime = Time.now - IO.read('/proc/uptime').split[0].to_i
    loadavg = IO.read('/proc/loadavg').split[0]
    free_memory = %x(free).split(" ")[9]

    stats = DB[:stats]
    p "#{Time.now} #{uptime} #{loadavg} #{free_memory}"
    stats.insert(:time => Time.now, :uptime => uptime, :loadavg => loadavg, :free => free_memory)
  end
end