% Author: Lauro Ojeda, 2014-2015
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')

FILTER = 1;
sample_file = {'GyroCal104'};

DIR = 'data/WHOIS_tag/raw_data/';
DIR_NAME = sprintf('%s%s', DIR, sample_file{1});
FILENAME  = sprintf('%s/%s.mat', DIR_NAME, sample_file{1});
SECTION  = [];

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, sample_file{1});
[W, A] = getdata(W, A, PERIOD, SECTION);

save(FILENAME, 'W', 'A', 'PERIOD');
