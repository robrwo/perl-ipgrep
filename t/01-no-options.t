use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0 y
172.16.2.1 z 172.16.0.1 a
", "matches ips in netblock";

script_runs( [qw( script/ipgrep 172.16.0.1/32 t/data/file1.txt )]);

script_stdout_is "172.16.2.1 z 172.16.0.1 a
", "matches ip in middle of the line";

script_runs( [qw( script/ipgrep 192.168.0.0/24 t/data/file1.txt )]);

script_stdout_is "192.168.0.1 x
192.168.0.2 x
", "matches ips in netblock";

done_testing;
