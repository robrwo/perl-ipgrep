use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --max-count 1 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0 y
", "matches ips in netblock";

script_runs( [qw( script/ipgrep -m1 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0 y
", "matches ips in netblock";

script_runs( [qw( script/ipgrep -o -m1 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0
", "shows only ips in netblock";

# Note: same behaviour as grep

script_runs( [qw( script/ipgrep -o -m2 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0
172.16.2.1
172.16.0.1
", "shows only ips in netblock";

done_testing;
