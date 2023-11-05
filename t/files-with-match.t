use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( bin/ipgrep --files-with-match 192.168.0.3 t/data/file2.txt )]);

script_stdout_is "t/data/file2.txt
", "files with match";

script_runs( [qw( bin/ipgrep -l 192.168.0.3 t/data/file2.txt t/data/file1.txt )]);

script_stdout_is "t/data/file2.txt
", "files with match";

script_runs( [qw( bin/ipgrep -l 192.168.0.4 t/data/file2.txt t/data/file1.txt )], { exit => 1 } );

script_stdout_is "", "files with match (nothing)";

done_testing;
