# RawnetAdmin

An inheritable, customisable admin interface for Ruby on Rails

## Installation

Add RawnetAdmin to your gemfile
```ruby
gem 'rawnet_admin', git: 'git@github.com:rawnet/rawnet-admin.git', branch: 'master'
```
And then bundle..
```sh
bundle install
```

## Basic Usage

### Routes

RawnetAdmin provides a method to mount the engine, and inject any additional routes you need. Just add the following to your `routes.rb` file

```ruby
Rails.application.routes.draw do
  # your other routes..

  RawnetAdmin.mount(self) do
    resources :users, only: [index, :edit, :update]
  end
end
```

### Controller

To create the `users` controller from the routing example above, create a new controller at `app/controllers/rawnet_admin/users_controller.rb` and inherit from `RawnetAdmin::ResourceController`

```ruby
module RawnetAdmin
  class UsersController < ResourceController
  end
end
```

In general, controllers utilise the methods and options defined by [InheritedResources](https://github.com/josevalim/inherited_resources)

### Views

You can override any of the [views used by the gem](https://github.com/rawnet/rawnet-admin/tree/master/app/views/rawnet_admin/resource), on a global or per-resource basis.

To override any views for the `users` resource specifically, create a folder at `app/views/rawnet_admin/users`

To override any views for _all_ resources, create a folder at `app/views/rawnet_admin/resource`

## Configuration

To configure RawnetAdmin, create an initializer at `app/config/initializers/rawnet_admin.rb` and enter the following;

```ruby
RawnetAdmin.configure do |config|
  config.site_name = "Rawnet Admin"
  config.user_method = :current_user
  config.authenticate_method = :authenticate_admin!
  config.parent_controller = '::ApplicationController'
end
```
