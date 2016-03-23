# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


MULTIPLIER = 10

def generate_users
  User.destroy_all
  #Profile.destroy_all

  puts 'Generating users'

  MULTIPLIER.times do
    # first_name = Faker::Name.first_name
    # last_name = Faker::Name.last_name
    # username = Faker::Company.name
    email = Faker::Internet.free_email("#{first_name} #{last_name}")

    # user = User.new(email: email, password: 'qwerqwer')
    # user.build_profile(first_name: first_name, last_name: last_name, username: username)
    user.save!
  end
end