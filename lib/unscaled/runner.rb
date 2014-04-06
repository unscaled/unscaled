require 'httparty'

module Unscaled
  class Runner
    attr_reader :name
    attr_reader :pool

    def initialize(name)
      @name = name
      @pool = {}
    end

    def update_process_list
      config  = fetch_config
      new_ids = config[:processes].map {|proc| proc[:id] }
      cur_ids = pool.keys

      ids_to_kill  = cur_ids - new_ids
      ids_to_start = new_ids - cur_ids

      ids_to_kill.each  do |id|
        puts "Stop  id: #{id}"
        pool.delete(id)
      end

      ids_to_start.each do |id|
        puts "Start id: #{id}"
        process_config = config[:processes].find {|i| i[:id] == id }
        pool[id] = process_config
      end
    end

    def fetch_config
      ::CONFIGS[name]
    end
  end
end
