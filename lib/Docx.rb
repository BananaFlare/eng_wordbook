require_relative 'Input'
# module for creation and interaction with docx file
module DocxFileWork
  def self.create_file
    title = Input.title
    Caracal::Document.save("#{title}.docx") do |doc|
      doc.h1 title.to_s
      doc.table [["№", "Word", "Transcription", "Translation"], ["fill it"]] do
        cell_style rows[0], background: "dddddd", bold: true
      end
    end
  end
end