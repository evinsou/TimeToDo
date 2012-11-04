# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create :id =>1,
                   :email => 'ivan@email.com',
                   :password => 'sex',
                   :password_confirmation => 'sex'
user = User.create :id =>2,
                   :email => 'satur@example.com',
                   :password => 'ation',
                   :password_confirmation => 'ation'

Duration.create [{:time_limit => 'yesterday'},
                 {:time_limit => 'today'},
                 {:time_limit => 'for a week'},
                 {:time_limit => 'for a month'},
                 {:time_limit => 'for half year'}]

Category.create [{:name => 'event'},
                 {:name => 'home'},
                 {:name => 'personal'},
                 {:name => 'travel'},
                 {:name => 'work'}]

user.tasks.create :user_id =>1,
                  :body => 'end scala project',
                  :start_in => Time.now,
                  :finish_by => Date.today + 1.month

user.tasks.create :user_id =>1,
                  :body => 'evening meeting in good place',
                  :start_in => Time.now + 6.hour,
                  :finish_by => Date.today + 1.day

user.tasks.create :user_id =>2,
                  :body => 'learn free-speaking ebglish',
                  :start_in => Time.now,
                  :finish_by => Date.today + 6.month

