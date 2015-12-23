package Bencher::Scenario::Data::Sah::Normalize;

# DATE
# VERSION

# TODO: benchmark normalize_clset

our $scenario = {
    summary => 'Benchmark normalizing Sah schema',
    participants => [
        {
            fcall_template => 'Data::Sah::Normalize::normalize_schema(<schema>)'
        },
    ],
    datasets => [

        {
            name    => 'str',
            summary => '',
            args    => {
                schema => 'str',
            },
        },

        {
            name => 'str_wildcard',
            args => {
                schema => 'str*',
            },
        },

        {
            name => 'array1',
            args => {
                schema => ['str'],
            },
        },

        {
            name => 'array3',
            args => {
                schema => ['str', len=>1],
            },
        },

        {
            name => 'array5',
            args => {
                schema => ['str', min_len=>8, max_len=>16],
            },
        },

    ],
};

1;
# ABSTRACT:
