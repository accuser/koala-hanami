RSpec.describe AuthenticateCredentials, type: :interactor do
  let(:repository) { double('UserRepository') }
  let(:interactor) { described_class.new(user_repository: repository) }
  let(:alice) { double('User', password: 'secret') }
  
  context "#call" do
    context "with valid parameters" do      
      before {
        expect(repository).to receive(:user_with_email).with('alice@example.com') { alice }
      }

      it "succeeds" do
        result = interactor.call(email: 'alice@example.com', password: 'secret')
        expect(result.success?).to be true
      end

      it "exposes :user" do
        result = interactor.call(email: 'alice@example.com', password: 'secret')
        expect(result).to respond_to :user
      end

      it "sets :user" do
        result = interactor.call(email: 'alice@example.com', password: 'secret')
        expect(result.user).to eq alice
      end
    end

    context "with incorrect :email" do
      before {
        expect(repository).to receive(:user_with_email).with('alice@example.com') { nil }
      }

      it "fails" do
        result = interactor.call(email: 'alice@example.com', password: 'secret')
        expect(result.failure?).to be true
      end

      it "describes the error" do
        result = interactor.call(email: 'alice@example.com', password: 'secret')
        expect(result.errors).to include email: ['not found']
      end
    end

    context "with incorrect :password" do
      before {
        expect(repository).to receive(:user_with_email).with('alice@example.com') { alice }
      }

      it "fails" do
        result = interactor.call(email: 'alice@example.com', password: 's3cr3t')
        expect(result.failure?).to be true
      end

      it "describes the error" do
        result = interactor.call(email: 'alice@example.com', password: 's3cr3t')
        expect(result.errors).to include password: ['incorrect']
      end
    end

    context "with missing :email parameter" do
      it "fails" do
        result = interactor.call(password: 'secret')
        expect(result.failure?).to be true
      end

      it "describes the error" do
        result = interactor.call(password: 'secret')
        expect(result.errors).to include email: ['is missing']
      end
    end

    context "with missing :password parameter" do
      it "fails" do
        result = interactor.call(email: 'alice@example.com')
        expect(result.failure?).to be true
      end

      it "describes the error" do
        result = interactor.call(email: 'alice@example.com')
        expect(result.errors).to include password: ['is missing']
      end
    end
  end
end 
