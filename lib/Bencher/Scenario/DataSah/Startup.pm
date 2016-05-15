package Bencher::Scenario::DataSah::Startup;

# DATE
# VERSION

our $scenario = {
    summary => 'Benchmark startup overhead of loading Data::Sah and generating validators',
    participants => [
        { name => 'perl'               , perl_cmdline => ["-e1"] },
        { name => 'load_dsah'          , perl_cmdline => ["-MData::Sah", "-e", 1] },
        { name => 'load_dsah+get_plc'  , perl_cmdline => ["-MData::Sah", "-e", '$sah = Data::Sah->new; $plc = $sah->get_compiler("perl")'] },
        { name => 'genval_bool_int'    , perl_cmdline => ["-MData::Sah=gen_validator", "-e", 'gen_validator("int")'] },
        { name => 'genval_str_int'     , perl_cmdline => ["-MData::Sah=gen_validator", "-e", 'gen_validator("int",{return_type=>"str"})'] },
        { name => 'genval_str_date'    , perl_cmdline => ["-MData::Sah=gen_validator", "-e", 'gen_validator("date",{return_type=>"str"})'] },
        { name => 'genval_str_5typical', perl_cmdline => ["-MData::Sah=gen_validator", "-e", 'for ("int", "str*", [int=>min=>1, max=>10], [str, min_len=>4], [any=>of=>["str",["array",of=>"str"]]]) { gen_validator("int",{return_type=>"str"}) }'] },
    ],
};

1;
# ABSTRACT:
