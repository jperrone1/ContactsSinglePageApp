require 'spec_helper'

describe Contact do 
    before :each do
      @contact = Contact.new(name: "George Tyrebiter", email: "gt@gt.com", number: "(415)555-1212", imgUrl: "http://www.blahblah.com")
  end

  it 'can be created' do 
    @contact.should be_valid
  end

  it 'should have a name, email & number;' do 
    @contact.name.should eq("George Tyrebiter")
    @contact.email.should eq("gt@gt.com")
    @contact.number.should eq("(415)555-1212")
    @contact.imgUrl.should eq("http://www.blahblah.com")

  end
end
