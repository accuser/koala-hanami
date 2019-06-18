RSpec.describe Token, type: :validation do
  context "#validate" do
    it "is successful" do
      result = described_class.new(token: SecureRandom.uuid).validate
      expect(result.success?).to be(true)
    end

    it "fails when the :token parameter is missing" do
      result = described_class.new({}).validate
      expect(result.success?).to be(false)
      expect(result.errors[:token]).to include 'is missing'
    end

    it "fails when the :token parameter is empty" do
      result = described_class.new(token: '').validate
      expect(result.success?).to be(false)
      expect(result.errors[:token]).to include 'must be filled'
    end

    it "fails when the :token parameter is a number" do
      result = described_class.new(token:1).validate
      expect(result.success?).to be(false)
      expect(result.errors[:token]).to include 'must be a string'
    end

    it "fails when :email is the wrong format" do
      result = described_class.new(token: 'TOKEN').validate
      expect(result.success?).to be(false)
      expect(result.errors[:token]).to include 'is in invalid format'
    end
  end
end