# Hoppinders

Hoppinders is the base Rails application used at
[Hoppinger](https://hoppinger.com/).

  ![YAY](https://media.giphy.com/media/D76YOxpdvXne8/giphy.gif)

## Installation

First install the hoppinders gem:

    gem install hoppinders

Then run:

    hoppinders projectname

This will create a Rails app in `projectname` using the latest version of Rails.

## Gemfile

To see the latest and greatest gems, look at Hoppinders'
[Gemfile](templates/Gemfile.erb), which will be appended to the default
generated projectname/Gemfile.

It includes application gems like:

* [Autoprefixer Rails](https://github.com/ai/autoprefixer-rails) for CSS vendor prefixes
* [Bourbon](https://github.com/thoughtbot/bourbon) for Sass mixins
* [Delayed Job](https://github.com/collectiveidea/delayed_job) for background
  processing
* [Flutie](https://github.com/thoughtbot/flutie) for `page_title` and `body_class` view
  helpers
* [jQuery Rails](https://github.com/rails/jquery-rails) for jQuery
* [Neat](https://github.com/thoughtbot/neat) for semantic grids
* [New Relic RPM](https://github.com/newrelic/rpm) for monitoring performance
* [Normalize](https://necolas.github.io/normalize.css/) for resetting browser styles
* [Postgres](https://github.com/ged/ruby-pg) for access to the Postgres database
* [Rack Canonical Host](https://github.com/tylerhunt/rack-canonical-host) to
  ensure all requests are served from the same domain
* [Rack Timeout](https://github.com/heroku/rack-timeout) to abort requests that are
  taking too long
* [Recipient Interceptor](https://github.com/croaky/recipient_interceptor) to
  avoid accidentally sending emails to real people from staging
* [Refills](https://github.com/thoughtbot/refills) for “copy-paste” components
  and patterns based on Bourbon, Neat and Bitters
* [Simple Form](https://github.com/plataformatec/simple_form) for form markup
  and style
* [Title](https://github.com/calebthompson/title) for storing titles in
  translations
* [Unicorn](https://github.com/defunkt/unicorn) to serve HTTP requests

And development gems like:

* [Dotenv](https://github.com/bkeepers/dotenv) for loading environment variables
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring
  objects
* [ByeBug](https://github.com/deivid-rodriguez/byebug) for interactively
  debugging behavior
* [Bullet](https://github.com/flyerhzm/bullet) for help to kill N+1 queries and
  unused eager loading
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the
  Gemfile for insecure dependencies based on published CVEs
* [Spring](https://github.com/rails/spring) for fast Rails actions via
  pre-loading
* [Web Console](https://github.com/rails/web-console) for better debugging via
  in-browser IRB consoles.
* [Quiet Assets](https://github.com/evrone/quiet_assets) for muting assets
  pipeline log messages

And testing gems like:

* [Capybara](https://github.com/jnicklas/capybara) and
  [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
  integration testing
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [Formulaic](https://github.com/thoughtbot/formulaic) for integration testing
  HTML forms
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [RSpec Mocks](https://github.com/rspec/rspec-mocks) for stubbing and spying
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for common
  RSpec matchers
* [Timecop](https://github.com/ferndopolis/timecop-console) for testing time

## Other goodies

Hoppinders also comes with:

* The [`./bin/setup`][setup] convention for new developer setup
* The `./bin/deploy` convention for deploying to Heroku
* Rails' flashes set up and in application layout
* A few nice time formats set up for localization
* `Rack::Deflater` to [compress responses with Gzip][compress]
* A [low database connection pool limit][pool]
* [Safe binstubs][binstub]
* [t() and l() in specs without prefixing with I18n][i18n]
* An automatically-created `SECRET_KEY_BASE` environment variable in all
  environments

## Git

This will initialize a new git repository for your Rails app. You can
bypass this with the `--skip-git` option:

    hoppinders app --skip-git true

## GitHub

You can optionally create a GitHub repository for the suspended Rails app. It
requires that you have [Hub](https://github.com/github/hub) on your system:

    curl http://hub.github.com/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub
    hoppinders app --github organization/project

This has the same effect as running:

    hub create organization/project

## Spring

Hoppinders uses [spring](https://github.com/rails/spring) by default.
It makes Rails applications load faster, but it might introduce confusing issues
around stale code not being refreshed.
If you think your application is running old code, run `spring stop`.
And if you'd rather not use spring, add `DISABLE_SPRING=1` to your login file.

## Dependencies

Hoppinders requires the latest version of Ruby.

Some gems included in Hoppinders have native extensions. You should have GCC
installed on your machine before generating an app with Hoppinders.

Use [OS X GCC Installer](https://github.com/kennethreitz/osx-gcc-installer/) for
Snow Leopard (OS X 10.6).

Use [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action)
for Lion (OS X 10.7) or Mountain Lion (OS X 10.8).

We use [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit) for
full-stack JavaScript integration testing. It requires QT. Instructions for
installing QT are
[here](https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit).

PostgreSQL needs to be installed and running for the `db:create` rake task.
