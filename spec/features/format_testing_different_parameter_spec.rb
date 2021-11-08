require './spec/fixtures/my_format_testing_different_parameter_class'

RSpec.describe MyFormatTestingDifferentParameterClass do
  let(:instance) do
    item = MyFormatTestingDifferentParameterClass.new
    item.other_parameter = format_parameter
    item
  end

  context ':format parameter is present' do
    context 'attribute has no values' do
      let(:format_parameter) { nil }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid format") }
    end

    context 'attribute has value that does not correspond to format' do
      let(:format_parameter) { 'invalid string' }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("invalid format") }
    end

    context 'attribute has value that corresponds to format' do
      let(:format_parameter) { '123456789' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end
  end
end
