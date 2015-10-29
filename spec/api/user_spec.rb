require "spec_helper"

describe "API" , :type => :api do

  it "can add user" do
   visit "/users", :format =>:json
   last_response.body.should  eql([].to_json)
 end

end
