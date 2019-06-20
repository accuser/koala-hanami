shared_examples_for "a view helper" do
  let(:example_view) { class ExampleView; include Web::View end }

    it "is included" do
    expect(example_view.included_modules).to include described_class
  end
end
