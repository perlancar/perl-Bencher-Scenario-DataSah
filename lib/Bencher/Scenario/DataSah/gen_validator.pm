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
        {args => {'return_type@' => $return_types, schema => 'str'}},
        {args => {'return_type@' => $return_types, schema => 'str*'}},
        {args => {'return_type@' => $return_types, schema => ['str', len=>8]}},
        {args => {'return_type@' => $return_types, schema => ['str', min_len=>1, max_len=>10]}},
        {args => {'return_type@' => $return_types, schema => 'date'}},
        {args => {'return_type@' => $return_types, schema => ['array', of=>['str', min_len=>1, max_len=>10]]}},
        {args => {'return_type@' => $return_types, schema => ['array', elems=>['int*', 'str*', 'float*', 're*']]}},
    ],
};

1;
# ABSTRACT:
