### Task description
https://github.com/kirillplatonov/apartments-feed-test

### Running on Heroku
https://apartments-demo.herokuapp.com/feed

Feed variants:
* https://apartments-demo.herokuapp.com/feed.json
* https://apartments-demo.herokuapp.com/feed.txt

### Running locally in Docker:
```
git clone git@github.com:mgz/apartments-demo.git && cd apartments-demo && \
docker build -t apartments-demo . && \
docker run --name apartments-demo --rm -p 3119:80 -it apartments-demo
```
When it's up, open http://localhost:3119 in browser.
