use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( bin/ipgrep --invert-match 192.168.0.2 t/data/file2.txt )]);

script_stdout_is "192.168.0.3 x
", "inverted match";

script_runs( [qw( bin/ipgrep -v 192.168.0.2 t/data/file1.txt )]);

script_stdout_is "192.168.0.1 x
172.16.1.0 y
172.16.2.1 z 172.16.0.1 a
", "inverted match";

done_testing;
