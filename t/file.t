use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( bin/ipgrep --file t/data/list.txt t/data/file1.txt )] );

script_stdout_is "192.168.0.1 x
172.16.1.0 y
", "files without match";

done_testing;
