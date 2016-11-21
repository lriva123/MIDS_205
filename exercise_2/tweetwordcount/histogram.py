import psycopg2
import sys

# Connect to a database
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

# Run SQL
cur.execute("SELECT word, count FROM tweetwordcount WHERE count >= %s and count <= %s ORDER BY count DESC",(sys.argv[1], sys.argv[2],))
records = cur.fetchall()
for rec in records:
    print rec[0]+':', rec[1] 
conn.commit()
conn.close()