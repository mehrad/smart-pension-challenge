# Smart Pension Parser Challenge
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

## About
This simple project will receives a log as argument and parse it to list pages by visit count and unique views.

## Install
### Clone the repository

```shell
git clone git@github.com:mehrad/smart-pension-challenge.git
cd smart-pension-challenge
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 2.7.2` as this is the version which i used in this project.

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.2
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle
```

### Usage
now You can simply run this command and get the appropriate result.

```shell
./parser.rb logs/webserver.log
```

### Test and Rubocop
If you want you can run Rspec to generate coverage or use rubocop.

rubocop supposed to be installed via the afformentioned  `bundle` command but if by anychance it is not a case for you
please install rubocop manually like this `gem install rubocop`; howeveer, i won't recommend it.

```shell
bundle exec rspec
bundle exec rubocop
```

Test coverage as simpleCov gem reports 
`254 relevant lines, 249 lines covered and 5 lines missed. ( 98.03% )`


## Architecture

I suppose nothing can describe the architecture of this app more than an illustration of it


![alt text](https://github.com/mehrad/smart-pension-challenge/blob/main/diagram.png?raw=true)                                              

As you can see what i had in my mind was to decouple each service and inject them into parser service. with this method we can easily replace any of them in the future; for instance, we can change File service to AWS file service. 
## Next steps


* Better exception handling.
* Better storage model which can populate by injection of a file service
* Interactive parser command in terminal

