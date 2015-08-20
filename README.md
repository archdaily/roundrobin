# RoundRobin

Add a Round-Robin based process to your flow.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'roundrobin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install roundrobin

## Usage

### Create your definitions

Create a file called ```roundrobin.yml``` in your `config` folder, like this one:
```yaml
default: &defaults
  roundrobin:
    instance_1:
      - foo
      - bar
      - lorem
    instance_2:
      -
        name: 'John'
        email: 'john@example.com'
      -
        name: 'Sara'
        email: 'sara@example.com'
test:
  <<: *defaults

development:
  <<: *defaults

production:
  <<: *defaults
```

### Create your initializer

Create a file called ```roundrobin.rb``` in your `config/initializers` folder, like this one:
```rb
Roundrobin.configure do |config|
  config.definitions = "#{Rails.root}/config/roundrobin.yml"
  config.namespace   = Rails.env
end
```

### Get the next iterator

```rb
>> Roundrobin.next('instance_1')
=> "foo"
>> Roundrobin.instance_1.next
=> "bar"

>> Roundrobin.next('instance_2')
=> {name: 'John', email: 'john@example.com'}
>> Roundrobin.next('instance_2')
=> {name: 'Sara', email: 'sara@example.com'}
```

All the data will be persisted to your DB, so you can restart your server, or do this in multiple threads and the results will be the same: you will be using the Round Robin algorith.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/roundrobin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
