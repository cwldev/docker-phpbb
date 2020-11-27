# phpBB in Docker
This is a docker implementation of popular forum software phpBB. This is currently based on version 3.3.2.

1. mkdir /phpbb
2. cd /phpbb
3. git clone https://github.com/cwldev/docker-phpbb.git .
4. docker build . -t phpbbimage
5. docker run -d \\<br/> 
  --name=phpBB \\<br/> 
  -e TZ=Canada/Eastern \\<br/> 
  -p 80:80 \\<br/>
  phpbbimage
  
The image presumes you will use an sqLite database - if so, used the full path for your database file /var/phpbbdata/database
If using any other database system, it's possible, but you'll have to connect to it.

After the install wizard is finished, you'll want to remove the install directory. Do this from your docker host:
docker exec -it phpBB rm -r /var/www/html/install

Note: To update local files:
git pull https://github.com/cwldev/docker-phpbb.git
