# frozen_string_literal: true
require_relative './.env'


# main file
require_relative "eng_wordbook/version"
require "caracal"
# подключение файла для создания docx
require_relative "docx" # содержит Input
# empty
module EngWordbook



  DocxFileWork.create_file
end




