#! /bin/bash
sudo unlink /etc/nginx/sites-enabled/default
ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
ln -s /home/box/web/hello.py /etc/gunicorn.d/test
sudo /etc/init.d/gunicorn restart
sudo /etc/init.d/mysql start
sudo gunicorn -c /home/box/web/etc/hello.py hello:app
