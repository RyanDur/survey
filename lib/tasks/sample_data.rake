namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "foo",
                 email: "foo@bar.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
    User.create!(name: 'nonadmin',
                email: 'non@admin.com',
                password: 'foobar',
                password_confirmation: 'foobar')
    99.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.email
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
