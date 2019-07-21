### Запуск на Heroku:
https://apartments-demo.herokuapp.com/feed

Варианты:
* https://apartments-demo.herokuapp.com/feed.json
* https://apartments-demo.herokuapp.com/feed.txt

### Запуск в Докере:
```
git clone git@github.com:mgz/apartments-demo.git && cd apartments-demo && \
docker build -t apartments-demo . && \
docker run --name apartments-demo --rm -p 3119:80 -it apartments-demo
```
После этого открыть в браузере http://localhost:3119