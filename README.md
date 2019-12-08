# Test Suite for Rocketmiles search and login UI elements

## Getting Started 

### Installing

First fork and clone the project.

After this you should run 

```
bundle install
```

In order to install all them gems for the project.

This will also require a creation of a database although we will not be using it.

```
rails db:create
```


## Running UI tests

```
bundle exec rspec spec/features/(file to run)
```

If you want them all to run then dont specify a file and run them all. All files for the tests exist under spec/features. 

