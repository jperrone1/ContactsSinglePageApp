
require 'spec_helper'

describe '/contacts' do

  before (:each) do
    @contacts = Contact.create!([{name: "George Tyrebiter", email: "gt@gt.com", number: "(415)555-1212", imgUrl: "http://www.blahblah.com"},
                           {name: "Porge Tyrebiter", email: "pt@gt.com", number: "(415)555-1313", imgUrl: "http://www.lahlah.com"}])
  end

  describe 'GET with JSON' do
    before (:each) do
      get '/contacts.json'
      @result = JSON.parse(response.body)
    end

    it 'returns all contact items' do
      @result.should_not be_nil
      @result.should have(2).contacts
    end

    it 'should not have updated_at or created_at' do
      @result[0]['updated_at'].should be_nil
      @result[0]['created_at'].should be_nil

      @result[1]['updated_at'].should be_nil
      @result[1]['created_at'].should be_nil
    end

    it 'should have the correct data in the contacts' do
      @result.find do |contact|
        contact["name"] == "George Tyrebiter"
      end.should_not be_nil
    end
  end
end