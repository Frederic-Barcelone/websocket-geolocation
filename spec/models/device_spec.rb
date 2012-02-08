# -*- coding: utf-8 -*-
require 'spec_helper'

describe Device do
  describe "before_create" do
    subject { Device.create.uuid }
    it "uuidが作成されること" do
      should_not be_blank
    end

    it "uuidのフォーマットが正しいこと" do
      should match(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/)
    end
  end
end
