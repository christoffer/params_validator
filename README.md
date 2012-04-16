# params_validator ![Continuous Integration](https://secure.travis-ci.org/chdorner/epubinfo.png?branch=master)

A DSL for validating request parameters, raises exceptions when validation failed. Currently only supports Rails.

Current status is very much alpha, this gem is still under development and not intended to use in production applications.

# Installation

Add this to your Gemfile and run `bundle install`

    gem 'params_validator'

# Usage

Basic usage:

    class WelcomeController < ActionController::Base
      rescue_from ParamsValidator::InvalidParamsException do |exception|
        render :text => 'Error', :status => :bad_request
      end

      validate_params_for :index, { :count => { :with => [:type_integer] } }
      def index
        @articles = Article.limit(params[:count])
      end
    end

## Validators

### TypeInteger

    validate_params_for :index, { :count => { :with => [:type_integer] } }

**Valid:**

* `count=1`

**Invalid:**

* `count=something`
* `count[]=1`
* `count[key]=value`

### TypeFloat

    validate_params_for :index, { :position => { :with => [:type_float] } }

**Valid:**

* `position=0.42`
* `position=1`

**Invalid:**

* `position=something`
* `position[]=0.42`
* `position[key]=0.42`

### TypeString

    validate_params_for :index, { :name => { :with => [:type_string] } }

**Valid:**

* `name=Jack`
* `name=1`

**Invalid:**

* `name[]=Jack`
* `name[key]=Jack`

### TypeHash

    validate_params_for :index, { :options => { :with => [:type_hash] } }

**Valid:**

* `options[all]=true`

**Invalid:**

* `options=all`
* `options[]=all`

### TypeArray

    validate_params_for :index, { :ids => { :with => [:type_array] } }

**Valid:**

* `ids[]=1`

**Invalid:**

* `ids=1`
* `ids[1]=true`

### Presence

    validate_params_for :search, { :q => { :with => [:presence] } }

**Valid:**

* `q=term`

**Invalid:**

* `q=`
* `somethingelse=term`

## Contributing to params_validator
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Christof Dorner. See LICENSE.txt for
further details.

