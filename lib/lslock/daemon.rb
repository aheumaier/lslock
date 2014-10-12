module Lslock
  class Daemon

    #
    # This is is the testing part launching 2 processes with file locks for 30 sec
    #
    def initialize
      @global_pids = []
      @test_dir = ARGV[0]
      raise if ARGV[0].length == 0
      ensure_temp_dir
    end


    # open a pidfile with exclusve lock and hold it for 30 sec
    def write_pid_file pid
      File.open( @test_dir+'/'+pid.to_s, File::RDWR|File::CREAT, 0644) do |f|
        f.flock(File::LOCK_EX)
        f.write(pid)
        f.flush
        sleep(30)
      end
    end

    def cleanup
      @global_pids.each do |p|
        Process.kill "TERM", p
        Process.wait p
      end
    end

    def start
      begin
       # poor mans daemonizer
        3.times do
          @pid = fork do
            @global_pids << @pid
            write_pid_file(@pid) if @pid
          end
        end

        # make shure we are clean again
        cleanup

      rescue
        # If WE FAIL KILL IT ANYWAY
        cleanup
        puts 'ERROR: directory path as argument required'
        puts 'Example: ./lslock.rb /tmp/'
        exit(1)
      end
    end

  end
end