use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( bin/ipgrep 172.16.0.1/32 t/data/file1.txt )]);

script_stdout_is "172.16.2.1 z 172.16.0.1 a
", "matches ip in middle of the line";

script_runs( [qw( bin/ipgrep --no-match-first-character  172.16.0.1/32 t/data/file1.txt )]);

script_stdout_is "172.16.2.1 z 172.16.0.1 a
", "matches ip in middle of the line";

script_runs( [qw( bin/ipgrep --match-first-character 172.16.0.1/32 t/data/file1.txt )], { exit => 1 } );

script_stdout_is "", "no match";

script_runs( [qw( bin/ipgrep -1 172.16.0.1/32 t/data/file1.txt )], { exit => 1 } );

script_stdout_is "", "no match";

script_runs( [qw( bin/ipgrep -1 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0 y
172.16.2.1 z 172.16.0.1 a
", "matches ips in netblock";

done_testing;
