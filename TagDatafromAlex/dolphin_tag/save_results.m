function save_results(sample_file, name)
	SAVE_EPS = 1;
	EPS_FILE = ['./fig/' name '_' sample_file '.eps']
	if(SAVE_EPS)
		set(gcf, 'PaperPositionMode', 'auto');
		print('-depsc2', EPS_FILE);
	end;
