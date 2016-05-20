package Bencher::Scenario::DataSah::Coerce;

# DATE
# VERSION

require Data::Sah::Coerce;
require DateTime;
require Time::Moment;

my $return_types = ['bool', 'str', 'full'];

our $scenario = {
    summary => 'Benchmark coercion',
    participants => [
        {
            name => 'gen_coercer',
            code_template => 'state $c = Data::Sah::Coerce::gen_coercer(type => <type>, coerce_to => <coerce_to>); $c->(<data>)',
        },
    ],
    datasets => [
        {
            name => 'date (coerce to float(epoch))',
            args => {
                type => 'date',
                coerce_to => 'float(epoch)',
                'data@' => [undef, "abc", 123, [], 1463373166, "2016-05-16"],
            },
        },
        # XXX date (coerce to DateTime)
        # XXX date (coerce to Time::Moment)
    ],
};

1;
# ABSTRACT:
