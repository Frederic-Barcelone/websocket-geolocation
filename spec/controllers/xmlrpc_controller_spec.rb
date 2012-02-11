# -*- coding: utf-8 -*-
require 'spec_helper'

describe XmlrpcController do
  describe "#set_location" do
    subject {XmlrpcController.new.send(:set_location, @device_uuid, @longitude, @latitude)}
    context "Deviceが存在しない場合" do
      before do
        @device_uuid = "hogehogepiyopiyo"
      end
      it "DeviceNotFoundError" do
        expect{ subject }.to raise_error("DeviceNotFoundError")
      end
    end
    context "Deviceが存在する場合" do
      before do
        @device = Factory(:device1)
        @user = Factory(:user1, :devices => [@device])
        @device_uuid = @device.uuid
      end
      it "エラーが帰ってこないこと" do
        expect{ subject }.to_not raise_error("DeviceNotFoundError")
      end
      its(["Success"]) { should be_true }

      context "locationsが正常に送られてきた場合" do
        before do
          @longitude = "35.6582"
          @latitude = "139.7456"
        end
        it "エラーが帰ってこないこと" do
          expect{ subject }.to_not raise_error("DeviceNotFoundError")
        end
        its(["Success"]) { should be_true }
        it "locationsのレコードが増えていること" do
          expect{ subject }.to change{ Location.count }.by(1)
        end
      end
    end
  end
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
        expect {
          subject
        }.should change(Device, :count).by(1)
      end
    end
    context "正email,不正certification_code" do
      before do
        @user.certification_code = "hoge"
      end
      it "認証できない事" do
        expect{ subject }.to raise_error("UserNotFoundError")
      end
    end
    context "不正email,正certification_code" do
      before do
        @user.email = "hoge"
      end
      it "認証できない事" do
        expect{ subject }.to raise_error("UserNotFoundError")
      end
    end
    context "不正email,不正certification_code" do
      before do
        @user.email = "hoge"
        @user.certification_code = "hoge"
      end
      it "認証できない事" do
        expect{ subject }.to raise_error("UserNotFoundError")
      end
    end
  end

end
