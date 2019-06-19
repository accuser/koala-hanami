RSpec.describe Id::Views::ApplicationLayout, type: :view do
  let(:layout)   { Id::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }
end
