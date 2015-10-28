require "spec_helper"

describe "API" , :type => :api do

  it "can add user" do
   get "/users",:format =>:json
   last_response.body.should  eql([].to_json)
 end

end
