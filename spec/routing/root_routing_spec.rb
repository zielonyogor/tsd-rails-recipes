require "rails_helper"

RSpec.describe "root routing", type: :routing do
  it "routes GET / to hello#index" do
    expect(get: "/").to route_to("hello#index")
  end
end