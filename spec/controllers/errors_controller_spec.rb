require 'spec_helper'

describe ErrorsController do
  render_views

  describe "error_404" do
    it "should have proper response code for all formats" do
      [ :html, :json ].each do |f|
        get :error_404, format: f
        expect(response.response_code).to eq 404
      end
    end

    it "should show the right page for .html" do
      [ :html ].each do |f|
        get :error_404, format: f
        expect(response.body).to match /doesn.*exist/
      end
    end

    it "should show the right .json" do
      get :error_404, format: :json
      expect(JSON.parse response.body).to eq({ "error" => "Not found" })
    end
  end

  describe "error_422" do
    it "should have proper response code for all formats" do
      [ :html, :json ].each do |f|
        get :error_422, format: f
        expect(response.response_code).to eq 422
      end
    end

    it "should show the 404 page .html" do
      [ :html ].each do |f|
        get :error_422, format: f
        expect(response.body).to match /doesn.*exist/
      end
    end

    it "should show the right .json" do
      get :error_422, format: :json
      expect(JSON.parse response.body).to eq({ "error" => "Unprocessable" })
    end
  end

  describe "error_500" do
    it "should have proper response code for all formats" do
      [ :html, :json ].each do |f|
        get :error_500, format: f
        expect(response.response_code).to eq 500
      end
    end

    it "should show the right page for .html" do
      [ :html ].each do |f|
        get :error_500, format: f
        expect(response.body).to include "I ate iNaturalist.org"
      end
    end

    it "should show the right .json" do
      get :error_500, format: :json
      expect(JSON.parse response.body).to eq({ "error" => "Internal Server Error" })
    end
  end
end
