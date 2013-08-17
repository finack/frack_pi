require 'yaml'
require 'settingslogic'

config_file = File.join(ENV['HOME'],'.frak.rc.yaml')
unless File.exists? config_file
  options = {
    "w1_path" => "/sys/bus/w1/devices",
  }
  STDERR.puts "Initialized configuration file in #{config_file}"
  File.open(config_file,'w') { |file| YAML.dump(options,file) }
end

class Frack::Settings < Settingslogic
  source File.join(ENV['HOME'],'.frak.rc.yaml')

  load!
end
