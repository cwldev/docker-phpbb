# docker-phpbb

1. git clone https://github.com/cwldev/docker-phpbb.git
2. docker build . -t phpbbimage
3. docker run -d \\
  --name=phpBB \\
  -e TZ=Canada/Eastern \\
  -p 80:80 \\
  phpbbimage
