[![Maintainability](https://api.codeclimate.com/v1/badges/39523975626d856a4997/maintainability)](https://codeclimate.com/github/psu-libraries/myaccount/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/39523975626d856a4997/test_coverage)](https://codeclimate.com/github/psu-libraries/myaccount/test_coverage)
[![<psu-libraries>](https://circleci.com/gh/psu-libraries/myaccount.svg?style=svg)](<https://circleci.com/gh/psu-libraries/myaccount>)
# Setup Your Environment 

## Mac

* Get `homebrew` installed and configured using [these instructions](https://brew.sh)
* `ruby` via `rbenv` ([Upgrading Ruby Version Using rbenv](https://github.com/psu-libraries/psulib_blacklight/wiki/Upgrading-Ruby-Version-Using-rbenv))

# Dependencies 

| Software |  Version |
|----------|------|
| `ruby`    |  2.7.6 |
| `rails`   |  6.0.3 |
| `redis`   | 5.0.7 |

# Development Setup

1.  [Make sure you have ssh keys established on your machine](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#generating-a-new-ssh-key)
1.  Clone the application and install:
    ``` 
    git clone git@github.com:psu-libraries/myaccount.git
    cd myaccount
    bundle install --without production
    ```
1.  Set local environment variables with values from [vault](https://vault.dsrd.libraries.psu.edu:8200/ui/vault/auth?with=oidc%2F)
1.  Run `yarn`
1.  Use [Modify Header Value](https://addons.mozilla.org/en-US/firefox/addon/modify-header-value/) browser extension to set the following headers: 
    ```
    URL: localhost
    Header Name: X_AUTH_REQUEST_EMAIL
    Header Value: [access id]@psu.edu
    
    URL: localhost
    Header Name: REMOTE_USER
    Header Value: [access id]
    ```
1.  Use one of the following options to run myaccount

    
## Option 1: Redis locally

Use the [redis docker image](https://hub.docker.com/_/redis/).

Should be able to just run it with a command listed in the docker hub page:

`docker run -d -p 6379:6379 --name redis-the-new-black redis:5.0.7`

Then boot up the rails server with caching turned on and you'll be all set.
 
 `bundle exec rails s --dev-caching`
 
Monitor the behavior by tailing the logs:

 `docker exec -it redis-the-new-black redis-cli monitor`
 
 ### Sidekiq
 
 Sidekiq is also a part of this application, so start it:
 
 ```
 bundle exec sidekiq
 ```
 
 Sidekiq is being used as a means of speeding things up for our end users. This is especially true for large batches of changes being requested and most true for large batches of changes that apply to a single bib (multiple calls). Without the concurrency that Sidekiq provides, these requests would take significantly more time. For example a request to place a hold on 32 volumes might take 106 seconds without Sidekiq and with Sidekiq that comes down to a still long, but much quicker 15 seconds. 
 
 Another option could have been hijacking the HTML and sending individual HTTP requests from JavaScript and then handling the response on each in JavaScript as well, but, we feel that this approach is less attractive due to the fact that it's even more complex than the Sidekiq and polling apparatus and seems to work against the intention of a form in HTML rather than with it.
 
 We have also decided to not allow Sidekiq jobs to retry due to failure. This is because we have already built in retries due to expected problems that could occur when attempting to interact with the web service. A retry could potentially be harmful given the immediate response needed by the user. 

### Putting it all together

Locally you'll need to run these commands:

```
bundle exec rails s
docker start redis-the-new-black
bundle exec sidekiq
```

## Option 2: Docker-compose 
You can run the whole myaccount stack via docker-compose. This will build a container for myaccount, sidekiq, and run web, sidekiq, and redis services. You will need a SYMWS_PIN to run locally. 

1.) copy example .envrc file 
```
cp .envrc.example .envrc
```
2.) edit and source the .envrc file

```
source .envrc
# optionally if you have direnv this is done for you for free
# https://direnv.net/
```
Once the configuration is set, you can start developing.

### Common Tasks
Start Up myaccount and start developing

```
docker-compose up --build -d
```

Get a shell into the myaccount container
replace "web" with "test" or "sidekiq" to get a shell into those services
Here you can run any linting, or tests that you normally run locally. i.e updating your bundle etc.
```
docker-compose exec web bash
```

Restart a container
```
docker-compose restart web
```

Run tests
```
docker-compose run test bundle exec rspec <path to file>
# we've wrapped this into a helper script
./bin/test <path to spec>

# or to run all specs
./bin/test
```


Volumes: Sometimes you may want to remove a volume you can easily remove all volumes with the follwowing commmand, they will get re-created when you do an up
```
docker-compose down -v
```

Run a one off command
```
docker-compose exec web bundle
```

Attach to the running container
If you want to do byebug, or pry you can attach your current session into the running container 
A Ctrl+C in this window will halt the web process, you can reload it by running 
`docker-compose restart web`
```
./bin/attach
```

Stop developing for the day, and go home!
```
docker-compose down
```

Change the Redis, or App Port
If you're running redis locally for another project, or you are running another rails project, you may need to change the port that's exposed for myaccount

```
echo "export REDIS_PORT=9999" >> .envrc
echo "export APP_PORT=3001" >> .envrc
source .envrc
docker-compose up -d
```
Now, myaccount redis will be exposed on port 9999, and myaccount will be exposed on port 3001.


# Terminology

There is a lot of domain terminology that can be confusing. Here are some of the bigger things to keep in mind:

* _Bib_ - a bibliographic container that holds calls and items, contains global information about the bibliographic record described like author and title which is the same throughout the entire record (p.s., bibs can be *large*).
* _Call_ - a call number based container that contains items and is contained within a bib. There can be multiple calls in a bib. There can be multiple items in a call. 
* _Item_ - info that describes the thing that is actually held or checked out. Has a barcode and checkout status.

This is an attempt at a quick and rough "[ubiquitous language](https://martinfowler.com/bliki/UbiquitousLanguage.html)"

# CI 
We use Circle CI to test myaccount. In the event of a test failure you can visit <https://circleci.com/gh/psu-libraries/myaccount> to see the jobs output. You can gain shell access to the build by choosing "Rerun with SSH" once logged in, your code will be checked out at the `/project` path.

# Healthcheck endpoint `/health`

* Uses OkComputer to help with writing healthchecks. The convention for healthchecks is as follows:
  * https://myaccount-okcomputer.dev.k8s.libraries.psu.edu/health - shows the application health (is rails started ok?)
  * https://myaccount-okcomputer.dev.k8s.libraries.psu.edu/health/all - shows all registered health checks in the system
  * https://myaccount-okcomputer.dev.k8s.libraries.psu.edu/health/{check_name} - shows an indiviual check. for example, https://myaccount-okcomputer.dev.k8s.libraries.psu.edu/health/version -- to emit the version that's running
* The current checks are default, version, redis, and all.
* You can also tack on .json to the routes to get a machine readable version of the healthcheck. i.e. https://myaccount-okcomputer.dev.k8s.libraries.psu.edu/health/all.json

# Config gem and environment variables

You can use either the yml file inheritance structure inherent to the config gem, or you can set environment variables. See ["Working with Environment Variable"](https://github.com/rubyconfig/config#working-with-environment-variables).

When changing these values you must restart the web server (passenger) _and_ sidekiq. Run `/bin/systemctl restart sidekiq` and  `passenger-config restart-app` on the server where the change is being applied. Locally just stop and start these again.

## Overriding pickup location labels

Pickup locations for holds placed are manually dictated by Lending and Reserves Services. Meaning, that although the Symphony system does have the ability to automate this and could be deriven from web service calls we do not do this (for reasons). The workflow is: they tell us what they want for the labels and we add them in `settings.yml`. This means we can override them as needed too by following the inheritance flow of the `config` gem. For production we use `production.local.yml` to override these values. Note that `Settings.pickup_locations` does _not_ affect the labels used in displaying the "Pickup at" column in the holds tables. That is currently not overridable. 

*Knockout prefix* - because we sometimes need to remove only certain keys in a Hash stored in settings we need to make use of the [`knockout_prefix`](https://github.com/rubyconfig/config#merge-customization) feature in the Config gem. The override of the Hash goes like this: 

1. Defined initially in settings.yml and tracked in repo
1. Overridden to be knocked out in settings.local.yml (i.e., `pickup_locations: --`)
1. Overridden again to be redefined in `settings/production.local.yml` without the keys that are meant to be removed

## Modifying announcement bar

1. Defined initially in settings.yml and tracked in repo
1. Overridden in settings.local.yml

```rb
show_announcement: true
announcement:
  # See https://fontawesome.com/icons
  icon: fa-exclamation-circle
  message: All University Libraries locations are closed, but we're here to help! See <a href="https://libraries.psu.edu/covid19"> University Libraries COVID-19 (novel coronavirus) Updates and Resources</a> for more information.
  # See https://getbootstrap.com/docs/4.4/utilities/colors/
  html_class: bg-warning
```

If one of the special keys isn't present, there is no ill-effect. It is just not there and the system operates as per usual. If the announcement array isn't present, then the default announcement in the translation file will show.
