install:
	 npm install -g hexo-cli;
	 npm install
rebuild:
	npm rebuild;
mathblock:
	 npm uninstall hexo-renderer-marked --save;
	 npm install hexo-renderer-kramed --save;
	 npm uninstall hexo-math --save;
	 npm install hexo-renderer-mathjax --save;
