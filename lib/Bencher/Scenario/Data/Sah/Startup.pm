package Bencher::Scenario::Data::Sah::Startup;

# DATE
# VERSION

use FindBin '$Bin';

# XXX replace $^X with perl path provided by bencher

our $scenario = {
    summary => 'Benchmark startup overhead of loading Data::Sah and generating validators',
    participants => [
        { name => 'perl',              cmdline => [$^X, "-I$Bin/..lib", "-e1"] },
        { name => 'load_dsah',         cmdline => [$^X, "-I$Bin/..lib", "-MData::Sah", "-e", 1] },
        { name => 'load_dsah+get_plc', cmdline => [$^X, "-I$Bin/..lib", "-MData::Sah", "-e", '$sah = Data::Sah->new; $plc = $sah->get_compiler("perl")'] },
        { name => 'gen_bool_val_int',  cmdline => [$^X, "-I$Bin/..lib", "-MData::Sah=gen_validator", "-e", 'gen_validator("int")'] },
        { name => 'gen_str_val_int',   cmdline => [$^X, "-I$Bin/..lib", "-MData::Sah=gen_validator", "-e", 'gen_validator("int",{return_type=>"str"})'] },
        { name => 'gen_str_vals',      cmdline => [$^X, "-I$Bin/..lib", "-MData::Sah=gen_validator", "-e", 'for ("int", "str*", [int=>min=>1, max=>10], [str, min_len=>4], [any=>of=>["str",["array",of=>"str"]]]) { gen_validator("int",{return_type=>"str"}) }'] },
    ],
};

1;
# ABSTRACT:
