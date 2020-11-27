# docker-phpbb

1. mkdir /phpbb
2. cd /phpbb
3. git clone https://github.com/cwldev/docker-phpbb.git .
4. docker build . -t phpbbimage
5. docker run -d \\<br/> 
  --name=phpBB \\<br/> 
  -e TZ=Canada/Eastern \\<br/> 
  -p 80:80 \\<br/>
  phpbbimage
