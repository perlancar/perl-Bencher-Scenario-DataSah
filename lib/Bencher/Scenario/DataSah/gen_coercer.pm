package Bencher::Scenario::DataSah::gen_coercer;

# DATE
# VERSION

require Data::Sah::Coerce;

my $return_types = ['bool', 'str', 'full'];

our $scenario = {
    summary => 'Benchmark coercion',
    participants => [
        {
            name => 'gen_coercer',
            code_template => 'Data::Sah::Coerce::gen_coercer(type => <type>, coerce_to => <coerce_to>)',
        },
    ],
    datasets => [
        {
            name => 'date (coerce to float(epoch))',
            args => {
                type => 'date',
                coerce_to => 'float(epoch)',
            },
        },
        {
            name => 'date (coerce to DateTime)',
            args => {
                type => 'date',
                coerce_to => 'DateTime',
            },
        },
        {
            name => 'date (coerce to Time::Moment)',
            args => {
                type => 'date',
                coerce_to => 'Time::Moment',
            },
        },
    ],
};

1;
# ABSTRACT:
