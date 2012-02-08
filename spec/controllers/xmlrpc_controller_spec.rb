# -*- coding: utf-8 -*-
require 'spec_helper'

describe XmlrpcController do
  describe "#authenticate" do
    subject {XmlrpcController.new.send(:authenticate, @user.email, @user.certification_code)}
    before do
      @user = Factory(:user1)
    end
    context "正しいemail,certification_code" do
      it "認証できること" do
        should_not be_false
      end
      it "uuidが返ること" do
        should match(/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/)
      end
      it "deviceが作成されて１増えること" do
        lambda {
          subject
        }.should change(Device, :count).by(1)
      end
    end
    context "正email,不正certification_code" do
      before do
        @user.certification_code = "hoge"
      end
      it "認証できない事" do
        should be_false
      end
    end
    context "不正email,正certification_code" do
      before do
        @user.email = "hoge"
      end
      it "認証できない事" do
        should be_false
      end
    end
    context "不正email,不正certification_code" do
      before do
        @user.email = "hoge"
        @user.certification_code = "hoge"
      end
      it "認証できない事" do
        should be_false
      end
    end
  end

end
