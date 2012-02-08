# -*- coding: utf-8 -*-

Factory.define :user1, :class => User do |u|
  u.name 'hoge'
  u.email 'test@example.com'
  u.password 'password'
  u.password_confirmation 'password'
end
