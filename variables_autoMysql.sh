database=school
table=student
values=("('108','曾华','男','1977-09-01','95033')" "('105','匡明','男','1977-09-01','95031')" "('107','王丽','女','1977-09-01','95033')" "('101','李军','男','1977-09-01','95033')" "('109','王芳','女','1977-09-01','95031')" "('103','陆君','男','1977-09-01','95031')")

source variables.sh #可以把以上的变量放在另一个脚本文件

mysql -uroot -p123456 -e "create database if not exists $database default character set = 'utf8'"
mysql -uroot -p123456 -e "create table $database.$table (sno varchar(20) primary key not null comment'学号(主码)',
    sname varchar(20) not null comment'学生姓名',
    ssex varchar(20) not null comment'学生性别',
    sbirthday datetime comment'学生出生年月',
    class varchar(20) comment'学生所在班级')"

for i in ${values[*]}
do
    mysql -uroot -p123456 -e "insert into $database.$table values $i"
done