require 'httparty'

module Unscaled
  class ProcessList
    attr_reader :list

    def initialize(config = {})
      @list = {}
      update(config)
    end

    def update(config)
      new_ids = config.keys
      cur_ids = list.keys

      ids_to_kill  = cur_ids - new_ids
      ids_to_start = new_ids - cur_ids

      ids_to_kill.each  do |id|
        puts "Stop  id: #{id}"
        process = list.delete(id)
        process.stop
      end

      ids_to_start.each do |id|
        puts "Start id: #{id}"
        process = Process.new(config[id][:command])
        process.start
        list[id] = process
      end
    end
  end
end
