use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --files-without-match 192.168.0.3 t/data/file2.txt )] );

script_stdout_is "", "files without match (nothing)";

script_runs( [qw( script/ipgrep -L 192.168.0.3 t/data/file2.txt t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt
", "files without match";

done_testing;
