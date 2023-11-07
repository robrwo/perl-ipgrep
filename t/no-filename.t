use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --no-filename 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "192.168.0.2 x
192.168.0.2 x
", "no filenames (multiple files)";

script_runs( [qw( script/ipgrep -h 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "192.168.0.2 x
192.168.0.2 x
", "no filenames (multiple files)";

script_runs( [qw( script/ipgrep -hn 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "2:192.168.0.2 x
2:192.168.0.2 x
", "no filenames with line numbers (multiple files)";

done_testing;
