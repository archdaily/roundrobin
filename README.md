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

```rb
>> Roundrobin.next(%w(foo bar))
=> "foo"
>> Roundrobin.next(%w(foo bar))
=> "bar"
>> Roundrobin.next(%w(foo bar))
=> "foo"

>> candidates = [{name: 'John', email: 'john@example.com'}, {name: 'Sara', email: 'sara@example.com'}])
>> Roundrobin.next(candidates) 
=> {name: 'John', email: 'john@example.com'}
>> Roundrobin.next(candidates)
=> {name: 'Sara', email: 'sara@example.com'}
>> Roundrobin.next(candidates) 
=> {name: 'John', email: 'john@example.com'}
```

All the data will be persisted to your DB, so you can restart your server, or do this in multiple threads and the results will be the same: you will be using the Round Robin algorith.

## Development

$ cd roundrobin
$ gem build roundrobin.gemspec
$ gem install ./roundrobin-XXX.gem

## Contributing

1. Fork it ( https://github.com/[my-github-username]/roundrobin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
