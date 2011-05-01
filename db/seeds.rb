# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create :email => 'mary@example.com', :password => 'guessit'

Duration.create [{:time_limit => 'yesterday'},
                 {:time_limit => 'today'},
                 {:time_limit => 'for a week'},
                 {:time_limit => 'for a month'},
                 {:time_limit => 'for half year'}]
