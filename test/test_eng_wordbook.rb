# тесты надо написать и разбить
# require_relative '../lib/docx.rb'
# require_relative  "test_helper"
# main test class

require "minitest/autorun"
require_relative '../lib/word_list'
require_relative '../lib/text_parser'
require_relative '../lib/parsing'
require_relative '../lib/input'
require 'stringio'

class WordListTest < WordList
  def initialize
  end
end

class TestWordList < Minitest::Test
  WL = WordListTest.new

  def test_wordlist_numbers_rework
    # WL.show_words
    WL.wholelot_array = [
      ['1', "dsjkljf"],
      ['3', "jwserhj"],
      ['4', "jwserhj"],
    ]
    WL.numbers_rework
    assert_equal [['1', "dsjkljf"], ['2', "jwserhj"], ['3', "jwserhj"],], WL.wholelot_array
    # WL.show_words
  end

  def test_include_word
    WL.wholelot_array = [["1 ", "moniker", " /ˈmɒnɪkə/ прозвище, кличка. The cat earned its \"scaredy-cat\" moniker.  "],
                         ["2 ", "kibble", " /ˈkɪbəl/ сухой корм для животных. The cat calmly ate its kibble.  "],
                         ["3 ", "cylindrical", " /sɪˈlɪndrɪkəl/ цилиндрический. The cucumber is a dark green cylindrical object.  "]]
    WL.include('kibble')
    assert_equal [["1 ", "moniker", " /ˈmɒnɪkə/ прозвище, кличка. The cat earned its \"scaredy-cat\" moniker.  "],
                  ["2 ", "kibble", " /ˈkɪbəl/ сухой корм для животных. The cat calmly ate its kibble.  "],
                  ["3 ", "cylindrical", " /sɪˈlɪndrɪkəl/ цилиндрический. The cucumber is a dark green cylindrical object.  "]], WL.wholelot_array


  #   WL.include('mimic')
  #   assert_equal [["1 ", "moniker", " /ˈmɒnɪkə/ прозвище, кличка. The cat earned its \"scaredy-cat\" moniker.  "],
  #                 ["2 ", "kibble", " /ˈkɪbəl/ сухой корм для животных. The cat calmly ate its kibble.  "],
  #                 ["3 ", "cylindrical", " /sɪˈlɪndrɪkəl/ цилиндрический. The cucumber is a dark green cylindrical object.  "],
  #                 ["4", " mimic ", " /ˈmɪm.ɪk/ ", " подражать, имитировать ", " The AI can mimic human speech patterns."]], WL.wholelot_array
    end
end

class TestTextParser < Minitest::Test
  def test_text_parser
    str = "1**dsjkljf\n2**jwserhj\n3**jwserhj\n"
    assert_equal [['1', "dsjkljf"], ['2', "jwserhj"], ['3', "jwserhj"],], TextParser::text_parser(str)
  end
end

class TestPageParser < Minitest::Test

  def test_page_content
    original_stdin = $stdin
    path = 'file://' + __dir__ + '/test_page_content.html'
    $stdin = StringIO.new(path)
    p path
    assert_equal 'test1234', Parsing_page::page_content
    $stdin = original_stdin
  end
end

class TestInput < Minitest::Test
  def test_input_link_fail
    assert_raises ('LnkError') do
      original_stdin = $stdin
      path = 'htt://' + __dir__ + '/test_page_content.html'
      $stdin = StringIO.new(path)
      Input::link
      $stdin = original_stdin

    end
  end

  def test_input_link_success

    original_stdin = $stdin
    path = 'https://www.popsci.com/environment/are-cats-really-afraid-of-cucumbers-experts/'
    $stdin = StringIO.new(path)
    assert_equal 'https://www.popsci.com/environment/are-cats-really-afraid-of-cucumbers-experts/', Input::link
    $stdin = original_stdin

  end
end
