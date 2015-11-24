# What's this?

This is a Ruby library to help you parse Apple .strings files

# Getting Started

### Usage

Include the library

`require_relative 'path/to/the/lib/osx_strings_file_parser'`

Parse a file

`file = File.read('/some/strings/file/here.strings')`

`OsxStringsFileParser.parse(file)`

`=> { 'Key1' => 'Value1', 'Key2' => 'Value2' }`


### Test

Install required libraries

`gem install rspec`

Run tests

`rspec spec/`
