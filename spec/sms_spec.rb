require 'spec_helper'

describe 'Testing my SMS application' do
 
  it 'Should send sms and verify expected response' do
    
    if GoogleText::Message.unread.empty? == false
      
      print "Marking old texts as read\n"
    
        until GoogleText::Message.unread.count == 0 do
          messages = GoogleText::Message.unread
          messages.first.mark_as_read
        end
    end
      
    #get spreadsheet data
    gdoc = GoogleDocs.new
    col1 = gdoc.getData(1)
    col2 = gdoc.getData(2)
    col3 = gdoc.getData(3)
    #startc = gdoc.getData(4) #use this if you want to start at different test number.
    
    col1.zip(col2, col3).each do |send, receive, test_num|
    #next if test_num.to_i < startc.to_i 
    
      puts ""
      print "Testing case# #{test_num}\n"
      print "Sending: #{send}\n"
    
      message = GoogleText::Message.new(:text => send, :to => $text_to)
      message.send
      message.sent?.should == true
    
      messages = GoogleText::Message.unread
 
      refresh = 1
      until messages != [] do
          puts "Waiting for sms reply, refreshing... #{refresh}"
          messages = GoogleText::Message.unread
          refresh = refresh + 1
        if (refresh == 60) then
          raise "NO SMS RECEIVED FOR TEST# #{test_num}\n"  
          break       
        end
      end
    
      print "Checking for response: #{receive}\n"
      messages.first.text.should include(receive)
      print "Good! Test Case# #{test_num} passed...\n"
      messages.first.mark_as_read
    end 
  end
    
end