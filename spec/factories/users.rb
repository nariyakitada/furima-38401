FactoryBot.define do
  factory :user do
    nick_name              {'test'}
    email                 {'test@example'}
    password              {'000000a'}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name2           {'ヤマダ'}
    last_name2            {'タロウ'}
    birthday              {'2000-01-01'}
  end
end