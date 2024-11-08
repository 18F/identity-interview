# identity-interview

A sample Rails application that can be used for interviews, it
may have bugs in it that are intended to be examples of what to fix

> [!NOTE]
> Please do not contribute bug fixes as pull requests to this repository!

## Setup

This application uses SQLite as its database, so it should be fairly easy to run locally

```bash
bundle install
bundle exec rake db:migrate
```

## Running the application

```bash
bundle exec rails server
```

## Running tests

```
bundle exec rspec
```

