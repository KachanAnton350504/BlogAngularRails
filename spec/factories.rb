# FactoryGirl.create :user do |user|
#   user.email                 "mbrown@yahoo.com"
#   user.password               "foobar"
#   user.password_confirmation  "foobar"
# end


FactoryGirl.define do
    
    factory :user do
        email "user@mail.ru"
        role "user"
        password "123456"
        password_confirmation "123456"
    end

    factory :post do
        title "TestPost"
        body "test test test"
        user_id  "2"
        rubric_ids "1"
    end

    factory :comment do
        body "TestBody"
        post_id "1"
        user_id "1"
    end

    factory :rubric do
        name "TestRubric"
    end
end
