# Omiya

(wanna be) KVS stub suite for integration test

## Installation

Add this line to your application's Gemfile:

    gem 'omiya'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omiya

## Usage

```ruby
get 'hoge' do
  'fuga'
end

cli.get('hoge') # => 'fuga'
```

```ruby
get /^hoge/ do
  'hoge something'
end

cli.get('hoge')     # => 'hoge something'
cli.get('hogehoge') # => 'hoge something'
```

```ruby
get /^hoge/ do |key|
  "#{key} value"
end

cli.get('hoge')     # => 'hoge value'
cli.get('hogehoge') # => 'hogehoge value'
```

```ruby
get /[a-z]+/ do |key|
  sleep 10
  'slow!'
end

get /.*/ do |key|
  raise Exception.new('not defined!')
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
