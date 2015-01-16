# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create standard administrator account when none is present.d
if Administrator.first.blank?
  Administrator.create(:first_name => 'Stefan', :last_name => 'Hagen', :email => 'stefan@stefanhagen.nl', :password => 'stefanhagen', :password_confirmation => 'stefanhagen')
end