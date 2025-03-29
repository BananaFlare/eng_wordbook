# frozen_string_literal: true

# input file connection
require_relative "input"
# module for creation and interaction with docx file
module DocxFileWork
  def self.table_arr_generator
    words = %w[1 2 345]
    transcription = %w[ˈsʌmθɪŋ ˈsʌmθɪŋ ˈsʌmθɪŋ]
    translation = %w[что-то что-то что-то]
    example = ["Something he had seen.", "Something he had seen.", "Something he had seen."]
    numeration = (1..words.size).to_a
    table_arr = [["№", "Word", "Transcription", "Translation", "Example"]]
    (0..words.size - 1).each do |i|
      table_arr.append([numeration[i].to_s, words[i], transcription[i], translation[i], example[i]])
    end
    table_arr
  end

  def self.create_file
    title = Input.title
    table_arr = table_arr_generator
    Caracal::Document.save(__dir__+"/../tmp/#{title}.docx") do |doc|
      doc.h1 title.to_s
      doc.table table_arr do
        cell_style rows[0], background: "dddddd", bold: true
      end
    end
  end
end
