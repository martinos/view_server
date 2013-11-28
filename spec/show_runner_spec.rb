require 'spec_helper'

describe 'ShowRunner' do
  it 'should call the show server method with data and extension' do
    data = 'This is data'
    launcher = mock('launcher')
    launcher.expects(:launch).with(data, 'csv')
    capture_io data do
      ViewServer::ShowRunner.run %w[-e csv -p -1], launcher
    end
  end
end
