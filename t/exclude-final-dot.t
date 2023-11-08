use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep 192.168.0.1 t/data/rdns.txt )]);

script_stdout_is "192.168.0.1.in-addr.arpa
", "matches false positive";

script_runs( [qw( script/ipgrep --exclude-final-dot 192.168.0.1 t/data/rdns.txt )], { exit => 1 } );

script_stdout_is "", "no match";

done_testing;
