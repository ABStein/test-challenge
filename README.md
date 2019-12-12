# Test Suite for Rocketmiles search and login UI elements

## Getting Started 

### Installing

First fork and clone the project.

You will need at least ruby 2.3.1 or higher as well as rails 5.2.4 or higher.

You can you use `brew` for these installations, more info here https://brew.sh/

After this run 
```
brew install rbenv
```
this will help maintain ruby versions. After this do

```
rbenv install 2.4.0
rbenv global 2.4.0
```
to install and check the version.

Then `gem install rails -v 5.2.4` and checking `rails -v` to make sure you have the correct version installed.

After these are installed, cd into the project and run

```
gem install bundler

bundle install
```

In order to install all them gems for the project.

This will also require a creation of a database although we will not be using it.

```
rails db:create
```

## Running UI/API tests

```
bundle exec rspec spec/features/(file to run)
```

If you want them all to run then dont specify a file and run them all. All files for the tests exist under spec/features. 

