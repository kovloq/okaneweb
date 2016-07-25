# Propinsi
[![Gem Version](https://badge.fury.io/rb/propinsi.svg)](https://badge.fury.io/rb/propinsi) [![Gem Version](https://travis-ci.org/kovloq/propinsi.svg)](http://travis-ci.org/kovloq/propinsi) 

Now, to get all provinces and Indonesia cities become easier. No need to find the excel file or sql file to get all the data. Propinsi gem has all of it. Just follow the instruction below: 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'propinsi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install propinsi

after instalation there will be some new files

lib/tasks/propinsi.rake
model/province.rb
model/city.rb 

run:

	$ rake db:migrate
to build model and create a table named provinces and cities in your database

then run: 

	$ rake propinsi:import
to import all provinces and cities into your created table. 

## Usage

### Usage with database
Since the province and city is already in your database, you can use it normaly as you call a table. 
To implement in a select box, you can use [collection select](http://guides.rubyonrails.org/form_helpers.html).
`<%= collection_select(:user, :province_id, Province.all, :id, :name) %>` 

### Usage without database
If you do not want to use database, you can use our array based list.

Display all data
`Propinsi.all`

Display all province
`Propinsi.propinsi`

Find province based on ID or name
`Propinsi.findpropinsi(1)`
`Propinsi.findpropinsi("Aceh")`

Diplay all City
`Propinsi.kota`

find city based on ID or name
`Propinsi.findkota(2)`
`Propoinsi.findkota(2)`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kovloq/propinsi. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

