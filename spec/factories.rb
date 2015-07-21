FactoryGirl.define do
  factory :user do
    name                  "Momozono sann"
    email                 "foobarhoge@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
    end
  end
  factory :micropost do
    content "Lorem ipsum"
    user
  end
  #factory :profession do
  #  profession_name
  #  user
  #end
end
