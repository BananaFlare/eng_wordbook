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
    patern = %r{\A(https?|ftp)://([a-z0-9]+(-{1}[a-z0-9]+)*\.[a-z]{2,63}){6}(:[0-9]{1,5})?(/.*)?\z}i
    raise EngWordBookError unless link.match?(patern)

    link
  end
end