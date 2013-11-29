require 'spec_helper'

describe 'CbCopyRunner' do
  it 'should copy to the clipboard' do
    data = 'This is the clipboard content'
    capture_io(data) do
      ViewServer::CbCopyRunner.run %w[-p -1]
    end

    pasted = capture_io('') do
      ViewServer::CbPasteRunner.run %w[-p -1]
    end

    pasted.must_equal data
  end
end
