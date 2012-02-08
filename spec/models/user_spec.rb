# -*- coding: utf-8 -*-
require 'spec_helper'

describe User do
  describe "before_create" do
    before do
      @user = Factory(:user1)
    end
    subject{ @user.certification_code }
    it "certification_codeが作成されること" do
      should_not be_blank
    end

    it "certification_codeが6文字になっていること" do
      should match(/[0-9a-zA-Z]{6}/)
    end
  end
end
