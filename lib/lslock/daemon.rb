module Lslock
  class Daemon

    #
    # This is is the testing part launching 2 processes with file locks for 30 sec
    #
    def initialize
      print  'Daemon called ' if $DEBUG
      @global_pids = []
      ensure_dir $LOCK_DIR
      self.run
    end


    # open a pidfile with exclusve lock and hold it for 30 sec
    def write_pid_file pid
      @global_pids << pid.to_s
      puts 'Writing lock file to ' + $LOCK_DIR+'/testlock_'+pid.to_s if $DEBUG
      File.open( $LOCK_DIR+'/testlock_'+pid.to_s, File::RDWR|File::CREAT, 0644) do |f|
        f.flock(File::LOCK_EX)
        f.write(pid)
        f.flush
        sleep(15)
      end
      puts 'Removing lock file ' + $LOCK_DIR+'/testlock_'+pid.to_s if $DEBUG
      FileUtils.remove $LOCK_DIR+'/testlock_'+pid.to_s
    end

    def run
      begin
       # poor mans daemonizer
        3.times do
          @pid = fork do
            @global_pids << @pid
            write_pid_file(@pid) if @pid
          end
        end

      rescue StandardError=>e
        puts "Error: #{e}"
        exit(1)
      end
    end

  end
end