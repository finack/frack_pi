module Frack
  class Probe

    attr_accessor :name, :path

    def initialize(name, path)
      self.name = name
      self.path = path
    end

    def active?
      search_for /YES$/
    end

    def temp_c
      match = search_for /\ t=(\d+)$/
      if match
        match[1].to_f / 1000.0
      else
        nil
      end
    end

    def temp_f
      temp_c * 9.0 / 5.0 + 32.0
    end

    def to_s
      "#{name}[Active:#{active?},C:#{temp_c},F:#{temp_f}]"
    end

    class << self

      def list_all
        probe_names = Dir.entries(Frack::Settings.w1_path).reject do |file|
          file !~ /^(\w{2})-(\w{12})$/
        end
        probe_names.map {|p| Probe.new(
          p,
          File.expand_path(File.join(Frack::Settings.w1_path, p, "w1_slave"))
        )}
      end

    end

    private

    def search_for(regexp)
      File.open(path).each_line do |line|
        line.match(regexp) {|m| return m}
      end
      nil
    end

  end
end
