use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --line-number 192.168.0.0/24 t/data/file1.txt )]);

script_stdout_is "1:192.168.0.1 x
2:192.168.0.2 x
", "line numbers";

script_runs( [qw( script/ipgrep -n 192.168.0.0/24 t/data/file1.txt )]);

script_stdout_is "1:192.168.0.1 x
2:192.168.0.2 x
", "line numbers";

script_runs( [qw( script/ipgrep -n 192.168.0.2 t/data/file1.txt )]);

script_stdout_is "2:192.168.0.2 x
", "line numbers";

done_testing;
