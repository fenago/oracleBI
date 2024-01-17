use File::Find;

use Cwd;

# Set the current working directory
my $cwd = 'C:\\Oracle\\Middleware\\Oracle_Home\\demo\\schema\\';

# Escape backslashes for regex
(my $escaped_cwd = $cwd) =~ s/\\/\\\\/g;

# Function to process each file
sub process_file {
    # Skip directories
    return if -d;

    # Read in the file
    local @ARGV = ($_);
    local $^I = '.bak'; # create a backup with .bak extension
    while (<>) {
        s/__SUB__CWD__/$escaped_cwd/g;
        print;
    }
}

# Recursively find and process files
find(\&process_file, $cwd);
