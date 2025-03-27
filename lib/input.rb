# frozen_string_literal: true

# input module
module Input
  # title input
  def self.title
    p "input title"
    title = gets.chomp
    !title.nil? ? title : ""
  end

  # link input
  def self.link
    p "input link"
    link = gets.chomp
    patern = /^((ftp|http|https):\/\/)?(www\.)?([A-Za-zА-Яа-я0-9]{1}[A-Za-zА-Яа-я0-9\-]*\.?)*\.{1}[A-Za-zА-Яа-я0-9-]{2,8}(\/([\w#!:.?+=&%@!\-\/])*)?/
    raise LinkError unless link.match?(patern)

    link
  end
  class InputError < StandardError;
  end
  class LinkError < InputError;
  end
end