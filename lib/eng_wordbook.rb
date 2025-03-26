# frozen_string_literal: true

require_relative "eng_wordbook/version"

require "caracal"
require_relative "Docx"
# u should divide this module int the future
module EngWordbook
  DocxFileWork.create_file
  class EngWordBookError < StandardError; end
end




