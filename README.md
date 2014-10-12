# Lslock

This  application shows all PID's which held a lock on files in
a given directory

Examples:
This command shows all PID which held a lock on files in /tmp
    lslock -d /tmp/

Other examples:
    lslock --verbose -d /tmp/

## Installation

Add this line to your application's Gemfile:

    gem 'lslock'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lslock

## Usage
   lslock [options] -d DIR

   For help use: lslock -h

   -h, --help          Displays help message
   -V, --version       Display the version, then exit
   -d, --lock_dir DIR  Output as little as possible, overrides verbose
   -V, --verbose       Verbose output

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
