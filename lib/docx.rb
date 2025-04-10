# frozen_string_literal: true

# input file connection
require_relative 'input'
require_relative 'text_parser'
require_relative 'api_deep_seek'
require_relative 'word_list'
# module for creation and interaction with docx file
module DocxFileWork
  WL = WordList.new
  def self.table_arr_generator
    wholelot_array = WL.wholelot_array
    table_arr = [["№", "Word", "Transcription", "Translation", "Example"]]

    wholelot_array = WL.exclude
    wholelot_array = WL.include("Wholelot")
    wholelot_array.each{|elem| table_arr.push(elem)}
    table_arr
  end

  def self.create_file
    title = Input.title
    table_arr = table_arr_generator
    if !File.directory?(__dir__+"/../tmp")
      Dir.mkdir(__dir__+"/../tmp")
    end
    Caracal::Document.save(__dir__+"/../tmp/#{title}.docx") do |doc|
      doc.h1 title.to_s
      doc.table table_arr do
        cell_style rows[0], background: "dddddd", bold: true
      end
    end
  end

end
