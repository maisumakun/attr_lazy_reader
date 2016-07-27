require 'spec_helper'

describe AttrLazyReader do
  it 'has a version number' do
    expect(AttrLazyReader::VERSION).not_to be nil
  end
end

describe Module do

  let(:dummy_class) { Class.new }

  describe '#attr_lazy_reader' do
    it 'is a private method of Module' do
      expect(Module.private_instance_methods).to include(:attr_lazy_reader)
    end

    it 'raises ArgumentError if called without block' do
      expect { dummy_class.send(:attr_lazy_reader, 'name') }.to raise_error(ArgumentError)
    end

    it 'raises NameError if called with inappropriate name' do
      expect { dummy_class.send(:attr_lazy_reader, '1_invalid') {} }.to raise_error(NameError)
    end

    it 'doesn\'t call block before method call' do
      expect do |b|
        dummy_class.send(:attr_lazy_reader, 'foo', &b)
        instance = dummy_class.new
      end.not_to yield_control
    end

    it 'calls block only once' do
      expect do |b|
        dummy_class.send(:attr_lazy_reader, 'foo', &b)
        instance = dummy_class.new
        instance.foo
        instance.foo
      end.to yield_control.once
    end

    it 'generates method whose return value is from block' do
      dummy_class.send(:attr_lazy_reader, 'foo') { 5 }
      instance = dummy_class.new
      expect(instance.foo).to eq 5
    end

    it 'evaluates block in instance context' do
      dummy_class.send(:attr_lazy_reader, 'foo') { @bar }
      instance = dummy_class.new
      instance.instance_variable_set :@bar, 80
      expect(instance.foo).to eq 80
    end

  end
end
