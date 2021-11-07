require '../fixtures/my_type_testing_class'

RSpec.describe MyTypeTestingClass do
  let(:instance) do
    item = MyTypeTestingClass.new
    item.parameter = type_parameter
    item
  end

  context ':type parameter is present' do
    context 'attribute has no values' do
      let(:type_parameter) { nil }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid type") }
    end

    context 'attribute has value that does not correspond to type' do
      let(:type_parameter) { 'invalid string' }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid type") }
    end

    context 'attribute has value that corresponds to type' do
      let(:type_parameter) { 123 }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end
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
