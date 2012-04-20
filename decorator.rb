# Decorator
class SimpleWriter
  def write_line(line)
    puts line
  end
end

class WriterDecorator
  def initialize(real_writer)
    @real_writer = real_writer
  end

  def write_line(line)
    @real_writer.write_line(line)
  end
end

w = SimpleWriter.new
w.write_line('hoge')

class KiraKiraDecorator < WriterDecorator
  def write_line(line)
    super("☆彡#{line}☆彡")
  end
end

w = KiraKiraDecorator.new(KiraKiraDecorator.new(SimpleWriter.new))
w.write_line('わぁい')
