class TextGenerator
  attr_accessor :author, :title, :text, :formatter

  def initialize(formatter)
    @author = 'Hoge'
    @title = 'Fuga'
    @text = 'Poyo'
    @formatter = formatter
  end

  def output
    @formatter.output(self)
  end
end

class Formatter
  def output(context)
    puts "#{context.title} written by #{context.author}"
    puts "------------------"
    puts "#{context.text}"
  end
end

class IkeIkeFormatter
  def output(context)
    puts "#{context.author}☆彡Ｃ:。ミ#{context.title}☆彡くコ:彡#{context.text}☆彡"
  end
end

t = TextGenerator.new(Formatter.new)
t.output
