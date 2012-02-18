# -*- coding: utf-8 -*-

Factory.sequence :uuid do |n|
  "#{n}" * 8 + "-" +
  "#{n}" * 4 + "-" +
  "#{n}" * 4 + "-" +
  "#{n}" * 4 + "-" +
  "#{n}" * 12
end

Factory.sequence :imei do |n|
  "imei#{n}"
end

FactoryGirl.define do
  factory :device do
    uuid Factory.next :uuid
  end

  factory :android1, :class => Android do
    imei Factory.next :imei
  end
end
