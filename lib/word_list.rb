# frozen_string_literal: true
require_relative 'api_deep_seek'
require_relative 'parsing'
require 'pp'
class WordList
  def initialize
    text = Parsing_page.page_content
    prompt = "выдели из статьи слова, которые могут быть непонятны уровню английского A2. В ответе оставь только найденные слова в формате: номер по порядку ** слово или абреввиатура (расшифровать) ** транскрипция ** перевод ** очень короткий пример использования слова из текста (без переносов строки). конец формата следующая строка. В ответе оставь только найденные слова#{text}"

    response = ApiDeepSeek.call_deepseek_api(prompt)
    @wholelot_array = TextParser.text_parser(response)
  end
  attr_accessor :wholelot_array
  # должна принимать слово, для которого должна посылать запрос в нейронку, если слова еще не было
  # @param [String]
  # @param [Array]
  # @return [Array] вернет измененный список слов
  def include (word)
    array = @wholelot_array
    word = word.strip.chomp
    array.each do |elem|
      word_index = elem.index(word)
      if word_index
        p "word already exists with №#{word_index + 1}"
        return array
      end
    end
    prompt = "для заданного слова #{word} выдай запись в таком формате:** слово или абреввиатура на английском (расшифровать для аббревиатуры) ** транскрипция ** перевод с английского ** очень короткий пример из текста из предыдущих запросов. В ответе не используй ничего кроме заданного форматом выражения"
    response = ApiDeepSeek.call_deepseek_api(prompt)
    line = TextParser.text_parser(response)[0]
    if wholelot_array.size > 0
      line[0] = (wholelot_array.length + 1).to_s
    else
      line[0] = '1'
    end
    wholelot_array.push(line)
    wholelot_array
  end

  # @param[Array]
  # @return[Array]
  def exclude
    # предусмотри пустой массив
    array = @wholelot_array
    word_select.each do |selected_word|
      array.each do |elem|
        elem.delete_if { elem[1] == selected_word[1] }
      end
      array.reject!(&:empty?)
    end
    array = numbers_rework
    return array
  end

  # @param [Array] Array to choose
  # @return [Array[String]] slected words
  def word_select
    array = @wholelot_array
    prompt = TTY::Prompt.new
    tmp_array = array.map { |elem| p elem; { elem[1] => elem } }
    res = prompt.multi_select("word to exclude selection:", tmp_array)
    res
  end

  # пересматривает индексы
  # @param [Array]
  # @return [Array]
  def numbers_rework
    array = @wholelot_array
    array.each_with_index do |elem, index|
      if elem[0] != (index + 1).to_s
        elem[0] = (index + 1).to_s
      end
    end
  end
  def show_words
    pp @wholelot_array
  end
end