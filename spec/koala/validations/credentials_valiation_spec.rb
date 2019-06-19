RSpec.describe CredentialsValidation, type: :validation do
  context "#validate" do
    it "is successful" do
      result = described_class.new(email: 'alice@example.com', password: 'secret').validate
      expect(result.success?).to be(true)
    end

    it "fails when the :email parameter is missing" do
      result = described_class.new(password: 'secret').validate
      expect(result.success?).to be(false)
      expect(result.errors[:email]).to include 'is missing'
    end

    it "fails when the :email parameter is empty" do
      result = described_class.new(email: '', password: 'secret').validate
      expect(result.success?).to be(false)
      expect(result.errors[:email]).to include 'must be filled'
    end

    it "fails when the :email parameter is a number" do
      result = described_class.new(email: 1, password: 'secret').validate
      expect(result.success?).to be(false)
      expect(result.errors[:email]).to include 'must be a string'
    end

    it "fails when :email is the wrong format" do
      result = described_class.new(email: 'alice', password: 'secret').validate
      expect(result.success?).to be(false)
      expect(result.errors[:email]).to include 'is in invalid format'
    end

    it "fails when :password is missing" do
      result = described_class.new(email: 'alice@example.com').validate
      expect(result.success?).to be(false)
      expect(result.errors[:password]).to include 'is missing'
    end

    it "fails when the :password parameter is empty" do
      result = described_class.new(email: 'alice@example.com', password: '').validate
      expect(result.success?).to be(false)
      expect(result.errors[:password]).to include 'must be filled'
    end

    it "fails when the :password parameter is a number" do
      result = described_class.new(email: 'alice@example.com', password: 1).validate
      expect(result.success?).to be(false)
      expect(result.errors[:password]).to include 'must be a string'
    end
  end
end
