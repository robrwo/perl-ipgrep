use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --only-matching 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0
172.16.2.1
172.16.0.1
", "shows ips only";

script_runs( [qw( script/ipgrep -o 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0
172.16.2.1
172.16.0.1
", "shows ips only";

script_runs( [qw( script/ipgrep -no 172.16/16 t/data/file1.txt )]);

script_stdout_is "3:172.16.1.0
4:172.16.2.1
4:172.16.0.1
", "shows ips with line numbers";

script_runs( [qw( script/ipgrep -noH 172.16/16 t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt:3:172.16.1.0
t/data/file1.txt:4:172.16.2.1
t/data/file1.txt:4:172.16.0.1
", "shows ips with filenames and line numbers";

script_runs( [qw( script/ipgrep -no 172.16/16 t/data/file1.txt t/data/file2.txt )]);

script_stdout_is "t/data/file1.txt:3:172.16.1.0
t/data/file1.txt:4:172.16.2.1
t/data/file1.txt:4:172.16.0.1
", "shows ips with filenames and line numbers";

script_runs( [qw( script/ipgrep -1o 172.16/16 t/data/file1.txt )]);

script_stdout_is "172.16.1.0
172.16.2.1
", "shows ips only (from beginning of the line)";

script_runs( [qw( script/ipgrep -lo 172.16/16 t/data/file1.txt )]);

script_stdout_is "t/data/file1.txt
", "shows filename";

done_testing;
