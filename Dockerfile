FROM harbor.k8s.libraries.psu.edu/library/ruby-2.7.6-node-16:20230306 as base
ARG UID=2000
WORKDIR /app
RUN useradd -u $UID app -d /app
RUN mkdir /app/tmp
RUN chown -R app /app
USER app
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler:2.1.4
RUN bundle config set path 'vendor/bundle'
RUN bundle install && \
  rm -rf /app/.bundle/cache && \
  rm -rf /app/vendor/bundle/ruby/*/cache
COPY package.json yarn.lock /app/
RUN yarn --frozen-lockfile && \
  rm -rf /app/.cache && \
  rm -rf /app/tmp
COPY --chown=app . /app

CMD ["/app/bin/start"]

FROM base as production 
RUN RAILS_ENV=production \
  bundle exec rails assets:precompile
CMD ["/app/bin/start"]


FROM base as ci

USER root
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list    

ENV RAILS_ENV=test

RUN apt-get update && apt-get install -y x11vnc \
    xvfb \
    fluxbox \
    wget \
    libnss3 \
    wmctrl \
    google-chrome-stable

USER app

FROM ci as test

RUN bundle

CMD ["sleep", "99999999"]



