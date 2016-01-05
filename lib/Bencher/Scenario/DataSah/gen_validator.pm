package Bencher::Scenario::DataSah::gen_validator;

# DATE
# VERSION

my $return_types = ['bool', 'str', 'full'];

our $scenario = {
    summary => 'Benchmark validator generation',
    participants => [
        {
            name => 'gen_validator',
            fcall_template => 'Data::Sah::gen_validator(<schema>, {return_type=> <return_type>})',
        },
    ],
    datasets => [
        {
            name    => 'type',
            summary => '',
            args    => {
                schema => 'str',
                'return_type@' => $return_types,
            },
        },
        {
            name    => 'type+req',
            summary => '',
            args    => {
                schema => 'str*',
                'return_type@' => $return_types,
            },
        },
        {
            name    => 'type+2clause',
            summary => '',
            args    => {
                schema => ['str*', min_len=>1, max_len=>10],
                'return_type@' => $return_types,
            },
        },
    ],
};

1;
# ABSTRACT:
