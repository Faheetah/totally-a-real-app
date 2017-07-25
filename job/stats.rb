require 'sequel'
require 'yaml'

config = YAML.load_file('config.yml')
DB = Sequel.connect(config['db'])

class Stats
  @queue = :stats

  def self.perform
    uptime = IO.read('/proc/uptime').split[0].split('.')[0]
    loadavg = IO.read('/proc/loadavg').split[0]
    free_memory = %x(free).split(" ")[9]
    hostname = %x(hostname)

    stats = DB[:stats]
    p "#{hostname} #{Time.now} #{uptime} #{loadavg} #{free_memory}"
    stats.insert(:hostname => hostname, :time => Time.now, :uptime => uptime, :loadavg => loadavg, :free => free_memory)
  end
end