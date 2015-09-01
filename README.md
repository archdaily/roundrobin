# RoundRobin
[![Build Status](https://travis-ci.org/archdaily/roundrobin.svg?branch=master)](https://travis-ci.org/archdaily/roundrobin)

Add a Round-Robin based process to your flow.

## Installation

Add this line to your application's Gemfile:

```rb
gem 'roundrobin'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install roundrobin
```

## Usage

Initialize your Round-Robin instance
```rb
>> rr = Roundrobin.new
```
or
```rb
>> rr = Roundrobin.new("redis://:p4ssw0rd@10.0.1.1:6380/15")
```
Now you can ask for the next item (in a Round-Robin logic)
```rb
>> rr.next(%w(foo bar))
=> "foo"
>> rr.next(%w(foo bar))
=> "bar"
>> rr.next(%w(foo bar))
=> "foo"

>> candidates = [{name: 'John', email: 'john@example.com'}, {name: 'Sara', email: 'sara@example.com'}])
>> rr.next(candidates)
=> {name: 'John', email: 'john@example.com'}
>> rr.next(candidates)
=> {name: 'Sara', email: 'sara@example.com'}
>> rr.next(candidates)
=> {name: 'John', email: 'john@example.com'}
```

All the data will be persisted to your DB, so you can restart your server, or do this in multiple threads and the results will be the same: you will be using the Round Robin algorith.

## Development

```
$ cd roundrobin
$ gem build roundrobin.gemspec
$ gem install ./roundrobin-XXX.gem
```

## Contributing

1. Fork it ( https://github.com/archdaily/roundrobin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
