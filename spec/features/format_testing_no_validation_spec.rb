require './spec/fixtures/my_class'

RSpec.describe MyClass do
  let(:instance) do
    item = MyClass.new
    item.parameter = format_parameter
    item
  end

  context ':format parameter is not present' do
    context 'attribute has no values' do
      let(:format_parameter) { nil }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end

    context 'attribute has value that does not correspond to format' do
      let(:format_parameter) { 'invalid string' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end

    context 'attribute has value that corresponds to format' do
      let(:format_parameter) { '123456789' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end
  end
end
