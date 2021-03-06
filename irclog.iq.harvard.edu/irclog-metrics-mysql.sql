# to upload the sql database
# download the latest mysql dump from http://dvn-vm1.hmdc.harvard.edu/data/mysql/
# mysql -u username -h host -p  < your-sql-dump.sql

# after the last community meeting, so after 2016-07-13, which is equivalent to timestamp > 1468503692

# this will count anons as people

SELECT (SELECT COUNT(distinct nick) as userCount FROM irclog WHERE timestamp > 1468503692) +
	(SELECT COUNT(nick) as userCount FROM irclog WHERE nick LIKE "dataverse-user%" and timestamp > 1468503692) as userCount;


# this will not count lines like "blank joined #dataverse"

SELECT COUNT(line) FROM irclog WHERE line NOT LIKE '%joined #dataverse' and timestamp > 1468503692;

