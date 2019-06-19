RSpec.describe Koala::Policies::Authentication, type: :policy do
  let(:action) { Web::Controllers::Pages::Home.new }

  it "exposes :anonymous?" do
    action.call({})
    expect(action.exposures).to include :anonymous?
  end
  
  it "exposes :authenticated?" do
    action.call({})
    expect(action.exposures).to include :authenticated?
  end

  it "exposes :current_user" do
    action.call({})
    expect(action.exposures).to include :current_user
  end
end
