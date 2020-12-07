clear all
close all

config = Config();

pattern_lengths = [6 8 10]; % такая запись значит что будет 3 разных паттерна соответственно длиной 6 8 и 10
[pattern] = make_pattern(config, pattern_lengths);

[imp, pattern_info] = make_dataset(config, pattern, 10000);

