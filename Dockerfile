#my chatapp docker file

FROM python:3.6.7
MAINTAINER Vaibhav_Kulkarni
ENV PYTHONUNBUFFERED=1
COPY ./ChatApplicationDeploy/chatapplication/requirement.txt /usr/src/chatapp/
WORKDIR /usr/src/chatapp/
RUN pip3 install django
RUN pip3 install gunicorn
RUN pip3 install channels
RUN pip3 install django-environ
RUN pip3 install mysqlclient
RUN pip3 install -r requirement.txt
CMD python3 manage.py migrate
CMD gunicorn --bind 0.0.0.0:8000 chatapplication.wsgi:application
EXPOSE 8000
