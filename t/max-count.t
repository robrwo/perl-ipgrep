use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --max-count 1 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0 y
", "matches ips in netblock";

script_runs( [qw( script/ipgrep -m1 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0 y
", "matches ips in netblock";

done_testing;
