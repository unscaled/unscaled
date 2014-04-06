require 'open3'

module Unscaled
  class Process
    attr_reader :command
    attr_reader :env

    attr_reader :stdin, :stdout, :stderr

    def initialize(command, env = {})
      @command = command
      @env     = env
    end

    def start
      @stdin, @stdout, @stderr, @wait_thr = Open3.popen3(env, command)
      @pid = @wait_thr[:pid]
    end

    def stop
      kill("TERM")
      @wait_thr.value
    end

    def running?
      @wait_thr && @wait_thr.alive?
    rescue Errno::ESRCH
      false
    end

    private

    def kill(signal)
      ::Process.kill(signal, pid)
    end

  end
end
