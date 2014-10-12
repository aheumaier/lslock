require_relative "lslock/version"
require_relative "lslock/utils"
require_relative "lslock/daemon"
include Lslock

module Lslock

  def run_daemon
    Thread.new do
      Lslock::Daemon.new
    end
    5.times do
      sleep(1)
      print  '.' if $DEBUG
    end
    puts ''
  end

end
