package Bencher::Scenario::DataSah::extract_subschemas;

# DATE
# VERSION

our $scenario = {
    summary => 'Benchmark extracting subschemas',
    participants => [
        {
            fcall_template => 'Data::Sah::Util::Subschema::extract_subschemas(<schema>)',
            result_is_list => 1,
        },
    ],
    datasets => [

        {
            args    => {
                schema => 'int',
            },
        },

        {
            args => {
                schema => [array => of=>"int"],
            },
        },

        {
            args => {
                schema => [any => of => ["int*", [array => of=>"int"]]],
            },
        },

        {
            args => {
                schema => [array => "of|"=>["int","float"]],
            },
        },

    ],
};

1;
# ABSTRACT:
