# frozen_string_literal: true
require_relative './.env'


# main file
require_relative "eng_wordbook/version"
require "caracal"
# подключение файла для создания docx
require_relative "docx" # содержит Input
require_relative 'driver_install'
# empty
module EngWordbook
  unless RUBY_PLATFORM.include?('linux')
    puts "Linux only"
    exit(1)
  end
  DocxFileWork.create_file
end




