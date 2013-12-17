SMS App Test
============

SMS app verification using google_text and google_drive gems. All the magic thankfully happens with these gems. I just used them together to make a simple sms app verication test suite. Enjoy!

## Requirements
- ruby 1.9.x
- bundler
- A google voice account and number

## Setup
- In google drive, create a new Spreadsheet. Name it whatever you want.
- In column A you will list the text you want to send.
- In column B you will list the expected responses.
- In column C you will list the test case number.
- In column D you can list the start test case number. This is optional.

![Alt text](https://github.com/isonic1/sms/blob/master/gdoc.png?raw=true)

- Copy the spreadsheet key. e.g. docs.google.com/spreadsheet/ccc?key=XXy2zZ&
- Enter your test variables in ./spec/settings.rb 

## Run Tests
- cd ./sms
- bundle install
- bundle exec rspec
