package Bencher::Scenario::DataSah::Validate;

# DATE
# VERSION

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
                'data@' => [1, "a"],
                'return_type@' => $return_types,
            },
        },
        {
            name => 'str+2clause',
            args => {
                schema => ['str', min_len=>1, max_len=>5],
                'data@' => ["abc", ""],
                'return_type@' => $return_types,
            },
        },
    ],
};

1;
# ABSTRACT:
