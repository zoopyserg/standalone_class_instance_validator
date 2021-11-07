require './fixtures/my_class'

RSpec.describe MyClass do
  let(:instance) do
    item = MyClass.new
    item.parameter = presence_parameter
    item
  end

  context ':presence parameter is not present' do
    context 'attribute has no values' do
      let(:presence_parameter) { nil }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end

    context 'attribute has values' do
      let(:presence_parameter) { 'something' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end
  end
end

