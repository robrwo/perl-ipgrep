use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( bin/ipgrep --version )] );

script_runs( [qw( bin/ipgrep -V )] );

done_testing;
