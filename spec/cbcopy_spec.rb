require 'spec_helper'

describe 'CbcopyRunner' do
  it 'should copy to the clipboard' do
    data = 'This is the clipboard content'
    capture_io(data) do
      ViewServer::CbCopyRunner.run %w[-p -1]
    end

    data.must_equal Clipboard.paste
  end
end
