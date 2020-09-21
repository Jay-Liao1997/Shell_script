

00 03 * * 07 innobackupex -uroot -p123456 --no-timestamp -S /tmp/mysql.sock /backup/foo/`date +\%Y\%m\%d`_full
00 03 * * 01 innobackupex -uroot -p123456 --no-timestamp -S /tmp/mysql.sock  --incremental /backup/foo/`date +\%Y\%m\%d` --incremental-basedir=/backup/foo/`date -d "1 days ago" +\%Y\%m\%d`_full
00 03 * * 02-06 innobackupex -uroot -p123456 --no-timestamp -S /tmp/mysql.sock --incremental /backup/foo/`date +\%Y\%m\%d` --incremental-basedir=/backup/foo/`date -d "1 days ago" +\%Y\%m\%d`


