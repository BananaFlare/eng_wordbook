# frozen_string_literal: true

# main file
require_relative "eng_wordbook/version"
require "caracal"
# подключение файла для создания docx
require_relative "docx" # содержит Input
# empty
module EngWordbook
  Input.link
  DocxFileWork.create_file
end




