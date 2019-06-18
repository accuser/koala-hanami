RSpec.describe User, type: :entity do
  let(:entity) { described_class.new(attributes) }
  let(:attributes) { Hash[id: 1, email: 'alice@example.com', password: 'secret', token: 'TOKEN'] }

  context ":id attribute" do
    it "exists" do
      expect(entity).to respond_to(:id)
    end

    it "can be set" do
      expect(entity.id).to eq 1
    end
  end

  context ":email attribute" do
    it "exists" do
      expect(entity).to respond_to(:email)
    end

    it "can be set" do
      expect(entity.email).to eq 'alice@example.com'
    end
  end

  context ":password attribute" do
    it "exists" do
      expect(entity).to respond_to(:password)
    end

    it "can be set" do
      expect(entity.password).to eq 'secret'
    end
  end

  context ":token attribute" do
    it "exists" do
      expect(entity).to respond_to(:token)
    end

    it "can be set" do
      expect(entity.token).to eq 'TOKEN'
    end
  end
end
