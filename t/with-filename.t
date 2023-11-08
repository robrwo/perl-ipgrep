use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --with-filename 192.168.0.0/24 t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt:192.168.0.1 x
t/data/file1.txt:192.168.0.2 x
", "with filenames";

script_runs( [qw( script/ipgrep -H 192.168.0.0/24 t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt:192.168.0.1 x
t/data/file1.txt:192.168.0.2 x
", "with filenames";

script_runs( [qw( script/ipgrep --with-filename --line-number 192.168.0.0/24 t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt:1:192.168.0.1 x
t/data/file1.txt:2:192.168.0.2 x
", "with file names and line numbers";

script_runs( [qw( script/ipgrep --with-filename 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file1.txt:192.168.0.2 x
t/data/file2.txt:192.168.0.2 x
", "with filenames (multiple files)";

script_runs( [qw( script/ipgrep --with-filename --label=foo 192.168.0.2 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file1.txt:192.168.0.2 x
t/data/file2.txt:192.168.0.2 x
", "with filenames (multiple files, label ignored)";

done_testing;
