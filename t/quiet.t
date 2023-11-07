use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --quiet 172.16/16 t/data/file1.txt )]);

script_stdout_is "", "quiet mode";

script_runs( [qw( script/ipgrep --silent 172.16/16 t/data/file1.txt )]);

script_stdout_is "", "quiet mode";

script_runs( [qw( script/ipgrep -q 172.16/16 t/data/file1.txt )]);

script_stdout_is "", "quiet mode";

script_runs( [qw( script/ipgrep -q 172.16.7.0/24 t/data/file1.txt )], { exit => 1 } );

script_stdout_is "", "quiet mode (no match)";

done_testing;
