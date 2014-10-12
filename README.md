# Lslock

This  application shows all PID's which held a lock on files in
a given directory

Examples:

This command shows all PID which held a lock on files in /tmp

    lslock -d /tmp/

Other examples:

    lslock --verbose -d /tmp/

## Installation

Install it yourself from the source dir as:

    $ gem install pkg/lslock-0.0.1.gem

## Usage
   lslock [options] -d DIR

   For help use: lslock -h

   -h, --help          Displays help message

   -V, --version       Display the version, then exit

   -t, --test          Run a small process writing lock files in given dir

   -d, --lock_dir DIR  Define dir to search in

   -V, --verbose       Verbose output

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
