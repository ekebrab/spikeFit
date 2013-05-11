The following are the awk commands that were executed to filter our hashtag mentions for each event:


Michael Jackson awk filters

	awk '/jackson/ {print > "jackson.tsv"}' tokens_by_hour-20091111.tsv
	awk '/michael/ {print > "michael.tsv"}' tokens_by_hour-20091111.tsv
	awk '/mj/ {print > "mj.tsv"}' tokens_by_hour-20091111.tsv


Kanye West & Taylor Swift ("Ima let you finish") filters

	awk '/kanye/ {print > "kanye.tsv"}' tokens_by_hour-20091111.tsv
	awk '/west/ {print > "west.tsv"}' tokens_by_hour-20091111.tsv
	awk '/taylor/ {print > "taylor.tsv"}' tokens_by_hour-20091111.tsv
	awk '/swift/ {print > "swift.tsv"}' tokens_by_hour-20091111.tsv


Balloon boy filter

	awk '/balloonboy/ {print > "balloonboy.tsv"}' tokens_by_hour-20091111.tsv

