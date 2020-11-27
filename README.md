# docker-phpbb

1. git clone https://github.com/cwldev/docker-phpbb.git
2. docker build . -t phpbbimage
3. docker run -d \\<br/> 
  --name=phpBB \\<br/> 
  -e TZ=Canada/Eastern \\<br/> 
  -p 80:80 \\<br/>
  phpbbimage
