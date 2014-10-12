require 'fileutils'

module Lslock

  RESULTS = {}

  def ensure_dir dir
    FileUtils.mkdir_p dir unless File.directory? dir
  end

  def get_file_inode file
    File.stat( file ).ino
  end

  def valid? input
    begin
      raise if input.length == 0
      raise unless File.directory? input[0]
    rescue  StandardError=>e
      puts "Error: #{e}" if $DEBUG
      raise 'ERROR: Directory path as argument required'
    end
  end

  def get_pid lock_line
    lock_line.split(' ')[5].split(':').last
  end

  def read_lock_table
    @lock_table = File.readlines "/proc/locks"
  end

  def find_lock_from_inode inode, lock_file
    read_lock_table unless @lock_table
    @lock_table.map do |element|
      if element =~  /#{inode}/
        RESULTS[get_pid(element)] = lock_file
      end
    end
  end

  def files_in_dir dir
    begin
    files = Dir.glob( dir+"**/*")
    raise if files.length == 0
    return files
    rescue StandardError=>e
      puts "Error: #{e}" if $DEBUG
      raise "No Files found"
    end
  end

  def format_output result
     puts 'PID   :  LockFile'
     result.each do |k,v|
       puts k+': '+v
     end
     puts ''
  end

end