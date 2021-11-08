require './fixtures/my_class_with_multiple_parameters'

RSpec.describe MyClassWithMultipleParameters do
  let(:instance) do
    item = MyClassWithMultipleParameters.new
    item.parameter1 = parameter1
    item.parameter2 = parameter2
    item
  end

  context 'attribute has no values' do
    let(:parameter1) { nil }
    let(:parameter2) { 123 }

    it { expect(instance.class_valid?).to be_falsey }
    it { expect{ instance.class_validate! }.to raise_error("invalid format,attribute can not be nil,invalid type") }
  end

  context 'attribute has value that does not correspond to format' do
    let(:parameter1) { 'invalid string' }
    let(:parameter2) { 123 }

    it { expect(instance.class_valid?).to be_falsey }
    it { expect{ instance.class_validate! }.to raise_error("invalid format") }
  end

  context 'attribute has value that corresponds to format' do
    let(:parameter1) { '123456789' }
    let(:parameter2) { 123 }

    it { expect(instance.class_valid?).to be_truthy }
    it { expect{ instance.class_validate! }.not_to raise_error }
  end

  context 'attribute has value that corresponds to type' do
    let(:parameter1) { 123 }
    let(:parameter2) { 123 }

    it { expect(instance.class_valid?).to be_falsey }
    it { expect{ instance.class_validate! }.to raise_error("invalid format,invalid type") }
  end

  context 'attribute has no values' do
    let(:parameter1) { '123456789' }
    let(:parameter2) { nil }

    it { expect(instance.class_valid?).to be_falsey }
    it { expect{ instance.class_validate! }.to raise_error("attribute can not be nil,invalid type") }
  end

  context 'attribute has value that corresponds to type' do
    let(:parameter1) { '123456789' }
    let(:parameter2) { 123 }

    it { expect(instance.class_valid?).to be_truthy }
    it { expect{ instance.class_validate! }.not_to raise_error }
  end
end
