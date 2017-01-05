#!/usr/bin/python
# -*- coding: utf-8
#redmine make issues from comments

import MySQLdb
import string

# соединяемся с базой данных
db = MySQLdb.connect(host="localhost", user="redmine", passwd="a_igttnd", db="redmine_default", charset='utf8')

# формируем курсор
cursor = db.cursor()

# запрос к БД
sql = """SELECT user_id, notes  FROM journals WHERE journalized_id='2985' LIMIT 10"""

# выполняем запрос
cursor.execute(sql)

# получаем результат выполнения запроса
data =  cursor.fetchall()

# перебираем записи
for rec in data:
    # извлекаем данные из записей - в том же порядке, как и в SQL-запросе
    user_id, notes = rec
    print ("project = Project.find_by_identifier(\"Promodo\") ")
    print ("status = IssueStatus.find_by_sql(\"select * from issue_statuses\")[0]")
    print ("u=User.find_by_id(\""),user_id,("\") ")
    print ("issue = Issue.new")
    print ("issue.author=u")
    print ("issue.project=project ")
    print ("issue.tracker_id=1")
    print ("issue.subject = \"TEST\" ")
    print ("issue.description = \" "),notes,("\"")
    print ("issue.save")
    print
# закрываем соединение с БД
db.close()
