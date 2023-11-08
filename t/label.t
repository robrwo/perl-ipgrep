use v5.18;

use Test2::V0;
use Test::Script;

use IO::File;
my $fh = IO::File->new("t/data/file1.txt");
my $data = join( "", <$fh>);
close $fh;

script_runs( [qw( script/ipgrep 172.16/16 )], { stdin => \$data } );

script_stdout_is "172.16.1.0 y
172.16.2.1 z 172.16.0.1 a
", "matches ips in netblock from stdin";

script_runs( [qw( script/ipgrep 172.16/16 - )], { stdin => \$data } );

script_stdout_is "172.16.1.0 y
172.16.2.1 z 172.16.0.1 a
", "matches ips in netblock from stdin";

script_runs( [qw( script/ipgrep --label=foo 172.16/16 - )], { stdin => \$data } );

script_stdout_is "172.16.1.0 y
172.16.2.1 z 172.16.0.1 a
", "matches ips in netblock from stdin (label ignored)";

script_runs( [qw( script/ipgrep --label=foo -H 172.16/16 - )], { stdin => \$data } );

script_stdout_is "foo:172.16.1.0 y
foo:172.16.2.1 z 172.16.0.1 a
", "matches ips in netblock from stdin (with label)";

done_testing;
