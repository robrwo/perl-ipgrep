use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep 172.1x t/data/file1.txt )], { exit => 255 } );

script_stderr_is "'172.1x' does not look like an IP address, IP address range or network block
", "error message";

script_stdout_is "", "no output";

script_runs( [qw( script/ipgrep 192.168.0.1-192.168.2 t/data/file2.txt )], { exit => 255 } );

script_stderr_is "'192.168.0.1-192.168.2' does not look like an IP address, IP address range or network block
", "error message";

script_stdout_is "", "no output";

script_runs( [qw( script/ipgrep --ignore-bad-addresses 192.168.0.1-192.168.2 t/data/file2.txt )] );

script_stdout_is "192.168.0.3 x
192.168.0.2 x
", "output";

done_testing;
