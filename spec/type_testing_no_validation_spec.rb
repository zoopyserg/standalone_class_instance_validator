require './fixtures/my_class'

RSpec.describe MyClass do
  let(:instance) do
    item = MyClass.new
    item.parameter = type_parameter
    item
  end

  context ':type parameter is not present' do
    context 'attribute has no values' do
      let(:type_parameter) { nil }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end

    context 'attribute has value that does not correspond to type' do
      let(:type_parameter) { 'invalid string' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end

    context 'attribute has value that corresponds to type' do
      let(:type_parameter) { 123 }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end
  end
end
