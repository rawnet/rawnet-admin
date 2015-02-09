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
    resources :users, only: [:index, :edit, :update]
    # any other custom routes
  end
end
```

### Controllers

#### ResourceController

The ResourceController provides a base for resourceful controllers, and supplies a template for the usual resource methods and CRUD actions. 

To create a `users` controller, create a new controller at `app/controllers/rawnet_admin/users_controller.rb` and inherit from `RawnetAdmin::ResourceController`

```ruby
module RawnetAdmin
  class UsersController < ResourceController
  end
end
```

In general, controllers utilise the methods and options defined by [InheritedResources](https://github.com/josevalim/inherited_resources)

### Views

#### Application views

The application views (and layout) can be overriden as needed. Many of these views, such as `application/_main_navigation.html.erb`, will need to be overriden to customise the navigation, logo etc. 

#### Resource views

You can override any of the [resource views used by the gem](https://github.com/rawnet/rawnet-admin/tree/master/app/views/rawnet_admin/resource), on a global or per-resource basis.

To override any views for the `users` resource specifically, create a folder at `app/views/rawnet_admin/users`

To override any views for _all_ resources, create a folder at `app/views/rawnet_admin/resource`

The only view you need to *create* for a resourceful controller is `_form.html.erb`, as no form view is provided by default. 

## Configuration

To configure RawnetAdmin, create an initializer at `app/config/initializers/rawnet_admin.rb` and enter the following;

```ruby
RawnetAdmin.configure do |config|
  config.site_name = "Rawnet Admin"
  config.user_method = :current_user
  config.authenticate_method = :authenticate_admin!
  config.parent_controller = '::ApplicationController'
  config.stylesheets << 'rawnet_admin/user-stylesheet'
  config.javascripts << 'rawnet_admin/user-javascript'
end
```
