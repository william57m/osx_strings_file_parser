# What's this?

This is a Ruby library to help you parse Apple .strings files

# Getting Started

### Installation

Install required libraries

`gem install activesupport`
`gem install iconv`

### Usage

In your code

`file = File.read('/some/strings/file/here.strings')``
`OsxStringsFileParser.parse(file)`

=> { 'Key1' => 'Value1', 'Key2' => 'Value2' }


### Test

Install required libraries

`gem install rspec`

Run tests

`rspec spec/`
