use v5.18;

use Test2::V0;
use Test::Script;

script_runs( [qw( script/ipgrep --version )] );

script_runs( [qw( script/ipgrep -V )] );

done_testing;
