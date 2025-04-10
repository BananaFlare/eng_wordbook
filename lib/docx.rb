# frozen_string_literal: true

# input file connection
require_relative 'input'
require_relative 'text_parser'
require_relative 'api_deep_seek'
require_relative 'word_list'
# module for creation and interaction with docx file
module DocxFileWork
  WL = WordList.new
  #метод создания списка для таблицы
  # @return [Array[Array]]
  def self.table_arr_generator
    wholelot_array = WL.wholelot_array
    WL.show_words
    table_arr = [["№", "Word", "Transcription", "Translation", "Example"]]
    prompt = TTY::Prompt.new
    tmp_array = ["include words","exclude words"]
    res = prompt.multi_select("would you like to change something:", tmp_array)
    unless res.nil?
      res.each do |option|
        if option =="include words"
          p "including words"
          p "empty string to exit"
          inpvar = "notnil"
          while inpvar != ""
            WL.include(inpvar) if inpvar != "notnil"
            inpvar = gets.chomp
            p inpvar
          end
        end
        if option == "exclude words"
          p "empty string to exit"
          wholelot_array = WL.exclude
        end
      end
    end
    p "final result"
    WL.show_words
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
