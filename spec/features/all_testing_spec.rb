require './spec/fixtures/my_class_with_all_validations'

RSpec.describe MyClassWithAllValidations do
  let(:instance) do
    item = MyClassWithAllValidations.new
    item.parameter = parameter
    item
  end

  context ':format parameter is present' do
    context 'attribute has no values' do
      let(:parameter) { nil }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid format,attribute can not be nil,invalid type") }
    end

    context 'attribute has value that does not correspond to format' do
      let(:parameter) { 'invalid string' }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid format") }
    end

    context 'attribute has value that corresponds to format' do
      let(:parameter) { '123456789' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end

    context 'attribute has value that corresponds to type' do
      let(:parameter) { 123 }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid format,invalid type") }
    end
  end
end
