use ExtUtils::MakeMaker;

WriteMakefile(
    "ABSTRACT"           => 'grep files by CIDR',
    "AUTHOR"             => 'Robert Rothenberg <rrwo@cpan.org>',
    "CONFIGURE_REQUIRES" => {
        "ExtUtils::MakeMaker" => 0
    },
    "LICENSE"          => "artistic_2",
    "MIN_PERL_VERSION" => '5.018000',
    "EXE_FILES"        => [qw( script/ipgrep )],
    "META_MERGE"       => {

        "keywords" => [qw( grep ipgrep netblock cidr utility script )],

        "meta-spec" => { version => 2 },

        resources => {

            bugtracker => { web => 'https://github.com/robrwo/perl-ipgrep/issues' },
            repository => {
                type => 'git',
                url  => 'git@github.com:robrwo/perl-ipgrep.git',
                web  => 'https://github.com/robrwo/perl-ipgrep/',
            },

        },

        "x_authority" => "cpan:RRWO",
    },
    "NAME"      => 'ipgrep',
    "PREREQ_PM" => {
        'Getopt::Long::Descriptive' => '0.105',
        'IO::File'                  => 0,
        'IO::Uncompress::Gunzip'    => 0,
        'List::Util'                => '1.33',
        'NetAddr::IP'               => 0,
        'Net::CIDR'                 => '0.20',
        'Sub::Quote'                => '2.003000',
        'warnings'                  => 0,
    },
    "TEST_REQUIRES" => {
        'Test2::V0'    => 0,
        'Test::Script' => 0,
    },
    "test" => {
        "TESTS" => "t/*.t"
    },
    "VERSION_FROM" => 'script/ipgrep',
);
