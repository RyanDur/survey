FactoryGirl.define do
  factory :user do
    name     "foo"
    email    "foobar@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
