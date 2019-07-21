FROM phusion/passenger-ruby26
ENV HOME /root

RUN bash -lc 'rvm --default use ruby-2.6.3'

# Configurre Nginx
RUN rm -f /etc/service/nginx/down; rm /etc/nginx/sites-enabled/default
ADD docker/overlay/etc/nginx/sites-enabled/webapp.conf /etc/nginx/sites-enabled/webapp.conf

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
apt-get install -y tzdata \
yarn && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]

# Copy app and install gems
RUN mkdir -p /home/app/webapp
WORKDIR /home/app/webapp
COPY --chown=app:app Gemfile Gemfile.lock ./
RUN gem install bundler &&  bundle config --global silence_root_warning 1 && bundle install --jobs 20 --retry 5 --deployment --without development test

COPY --chown=app:app . ./

EXPOSE 80

ENV RAILS_ENV=production \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_LOG_TO_STDOUT=true

COPY docker/overlay/ /
RUN chown -R app:app /home/app
RUN chmod +x /etc/my_init.d/*
