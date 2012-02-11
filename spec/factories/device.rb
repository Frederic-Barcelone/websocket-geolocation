# -*- coding: utf-8 -*-

Factory.sequence :uuid do |n|
  "#{n}" * 8 + "-" +
  "#{n}" * 4 + "-" +
  "#{n}" * 4 + "-" +
  "#{n}" * 4 + "-" +
  "#{n}" * 12
end

Factory.sequence :model do |n|
  "model#{n}"
end

Factory.sequence :imei do |n|
  "imei#{n}"
end

Factory.define :device1, :class => Device do |u|
  u.uuid Factory.next :uuid
  u.model Factory.next :model
  u.imei Factory.next :imei
end
