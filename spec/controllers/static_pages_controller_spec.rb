require 'spec_helper'

describe StaticPagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "returns http success" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'live'" do
    it "returns http success" do
      get 'live'
      response.should be_success
    end
  end

  describe "GET 'draft'" do
    it "returns http success" do
      get 'draft'
      response.should be_success
    end
  end

  describe "GET 'results'" do
    it "returns http success" do
      get 'results'
      response.should be_success
    end
  end

end
