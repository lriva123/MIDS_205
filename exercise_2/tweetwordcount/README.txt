Clone this directory to UCB MIDS W205 EX2-FULL AMI instance with a running postgres, python and stream parse applications.

1. cd <where the above directory got cloned>/tweetwordcount
2. sparse run

After running the sparse spouts/bolts application, you can check out what words and frequencies were stored in the postgres database.

finalresults.py will show you how many times the word hello showed up in the counted live tweets. Example:
python finalresults.py hello

histogram.py will show you words between the specified counts (i.e. between 3 and 8)
python histogram.py 3 8
