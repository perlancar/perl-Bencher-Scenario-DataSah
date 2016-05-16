package Bencher::Scenario::DataSah::Validate;

# DATE
# VERSION

require Data::Sah;
require DateTime;
require Time::Moment;

my $return_types = ['bool', 'str', 'full'];

our $scenario = {
    summary => 'Benchmark validation',
    participants => [
        {
            name => 'gen_validator',
            code_template => 'state $v = Data::Sah::gen_validator(<schema>, {return_type => <return_type>}); $v->(<data>)',
        },
    ],
    datasets => [
        {
            name => 'int',
            args => {
                schema => 'int',
                'data@' => [undef, 1, "a"],
                'return_type@' => $return_types,
            },
        },
        {
            name => 'str+2clause',
            args => {
                schema => ['str', min_len=>1, max_len=>5],
                'data@' => [undef, "abc", ""],
                'return_type@' => $return_types,
            },
        },
        {
            name => 'date (coerce to int(epoch))',
            args => {
                schema => ['date'],
                'data@' => [undef, "abc", 1463371843, "2016-05-16", DateTime->now,
                            Time::Moment->now,
                        ],
                'return_type@' => $return_types,
            },
        },
        # XXX: date (coerce to DateTime)
        # XXX: date (coerce to Time::Moment)
    ],
};

1;
# ABSTRACT:
