require "rest-client"
require "csvoodoo"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
voodoo = CSVoodoo::Voodoo.new do
  with_row do |row|
    puts "Processing #{row}"
    User.create(
      first_name: row[:first_name],
      last_name: row[:last_name],
      company: row[:company]
    ) do |u|
      u.id = row[:code]
    end
  end
end
voodoo.process('public/seed.csv')
