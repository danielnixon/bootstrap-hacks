all:
	lessc progressbar.less > progressbar.css
	lessc -x progressbar.less > progressbar.min.css