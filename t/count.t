use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( bin/ipgrep --count 192.168.0.2 t/data/file1.txt )]);

script_stdout_is "1
", "count (one file)";

script_runs( [qw( bin/ipgrep --count -H 192.168.0.2 t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt:1
", "count (one file, with filenames)";

script_runs( [qw( bin/ipgrep --count 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file1.txt:1
t/data/file2.txt:1
", "count";

script_runs( [qw( bin/ipgrep -c 192.168/24 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file1.txt:2
t/data/file2.txt:2
", "count";


script_runs( [qw( bin/ipgrep -ch 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "1
1
", "count without filenames";

script_runs( [qw( bin/ipgrep --count 192.168.0.3 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file1.txt:0
t/data/file2.txt:1
", "count (some with no matches)";

script_runs( [qw( bin/ipgrep -c -l 192.168.0.3 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file2.txt
", "only files with match, overrides count";

script_runs( [qw( bin/ipgrep -cv 192.168.0.2 t/data/file1.txt )]);

script_stdout_is "3
", "count (one file, inverted)";


done_testing;
