require 'spec_helper'
RSpec.describe PERSONFILEPROCESSOR do
  describe 'raise exception when unsupported file separator passed' do
    subject do
      described_class.new(
        file: File.read('spec/fixtures/people_by_percent.txt'),
        file_format: '-'
      ).process
    end

    it 'raises an error' do
      expect { subject }.to raise_error('file format - not supported')
    end
  end
end
