# frozen_string_literal: true

require_relative "eng_wordbook/version"

module EngWordbook
  class Error < StandardError; end
  extend self
  def hello
    p "hello"
  end
end
