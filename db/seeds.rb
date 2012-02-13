require 'rest-client'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EVENTBRITE = HashWithIndifferentAccess.new(YAML.load(File.read(Rails.root.join('config/keys/eventbrite.yml'))))[Rails.env]
list_attendees = "http://www.eventbrite.com/json/event_list_attendees"
remote_users = RestClient.get list_attendees, { :params => EVENTBRITE }
collection = JSON.parse(remote_users)["attendees"]
collection.each do |attendee|
  u = attendee['attendee']
  full_name = [u['first_name'], u['last_name']].join(' ')
  unless User.exists?(:name => full_name)
    user_params = {}
    user_params.merge!(:name => full_name)
    user_params.merge!(:company => u['company']) unless u['company'].blank?
    unless u['home_city'].blank?
      user_params.merge!(:location => Location.create(:city => u['home_city']))
    end
    user = User.create(user_params)
  end
end
