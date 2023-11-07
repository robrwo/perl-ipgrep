use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'ipgrep',
    VERSION_FROM     => 'script/ipgrep',
    ABSTRACT         => 'grep files by CIDR',
    AUTHOR           => 'Robert Rothenberg <rrwo@cpan.org>',
    MIN_PERL_VERSION => 'v5.18',
    EXE_FILES        => [qw( script/ipgrep )],
    PREREQ_PM        => {
        'Getopt::Long::Descriptive' => 0,
        'IO::File'                  => 0,
        'IO::Uncompress::Gunzip'    => 0,
        'List::Util'                => '1.33',
        'NetAddr::IP'               => 0,
        'Sub::Quote'                => '2.003000',
        'warnings'                  => 0,
    },
    TEST_REQUIES => {
        'Test2::V0'    => 0,
        'Test::Script' => 0,
    },
);
