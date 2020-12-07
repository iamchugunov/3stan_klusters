clear all
close all

config = Config();

pattern_lengths = [10 5 8 13 20];
[pattern] = make_pattern(config, pattern_lengths);

[imp, pattern_info] = make_dataset(config, pattern, 10000);

