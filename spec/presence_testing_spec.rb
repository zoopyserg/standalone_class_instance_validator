require '../fixtures/my_presence_testing_class'

RSpec.describe MyPresenceTestingClass do
  let(:instance) do
    item = MyPresenceTestingClass.new
    item.parameter = presence_parameter
    item
  end

  # todo: test when I test one validation first, and a little leater second validatoin
  context ':presence parameter is present' do
    context 'attribute has no values' do
      let(:presence_parameter) { nil }

      it { expect(instance.class_valid?).to be_falsey }
      it { expect{ instance.class_validate! }.to raise_error("attribute can not be nil") }
    end

    context 'attribute has values' do
      let(:presence_parameter) { 'something' }

      it { expect(instance.class_valid?).to be_truthy }
      it { expect{ instance.class_validate! }.not_to raise_error }
    end
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

