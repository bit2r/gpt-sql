.mode csv
.import "data/key_author.csv" key_author

.header on
.mode column

SELECT *
  FROM key_author
 LIMIT 10;

SELECT count(*)
  FROM key_author;
  
  