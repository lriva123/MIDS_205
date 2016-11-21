from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT


class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        self.conn = psycopg2.connect(database="postgres", user="postgres", password="pass", host="localhost", port="5432")
        self.cur = self.conn.cursor()
        self.cur.execute("SELECT count(*) FROM pg_database WHERE datname='tcount'")
        db_recs = self.cur.fetchall()
        db_cnt = 0
        for db in db_recs:
            db_cnt=int(db[0])
            self.conn.commit()
        if db_cnt == 0:
            self.conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
            self.cur.execute("""CREATE DATABASE tcount;""")
            self.conn.commit()
			
        self.conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        self.cur = self.conn.cursor()	
        self.cur.execute("SELECT count(*) FROM pg_tables WHERE TABLENAME='tweetwordcount'")
        tbl_recs = self.cur.fetchall()
        tbl_cnt = 0
        for tbl in tbl_recs:
            tbl_cnt=int(tbl[0])
            self.conn.commit()
        if tbl_cnt == 0:
            self.cur.execute("""CREATE TABLE Tweetwordcount
                                (word TEXT PRIMARY KEY     NOT NULL,
                                 count INT     NOT NULL);""")
            self.conn.commit()

        self.cur.execute("SELECT word, count from tweetwordcount")
        wrd_recs = self.cur.fetchall()
        for wrd in wrd_recs:
            self.counts[wrd[0]] = wrd[1]
            self.conn.commit()       

    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])
        if self.counts[word] == 1:
            self.cur.execute("INSERT INTO tweetwordcount (word,count) VALUES (%s, %s)", (word,1))
        else:
            self.cur.execute("UPDATE tweetwordcount SET count=count+1 WHERE word=%s", (word,))
        self.conn.commit()

        if self.counts[word] > 0: 
            self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
