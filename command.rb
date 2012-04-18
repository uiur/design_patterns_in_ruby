# Commandパターンの本質は、特定の動作をオブジェクトに抜き出すこと.
# 共通するインターフェース(execute)をもつだけでシンプル
# シンプルだけど用途はとても広い
# あまりいいの思いつかなかったから例はテキトウ
class Command
  attr_reader :description
  def initialize(description)
    @description = description
  end
end

class YeahCommand < Command
  def initialize
    super('Yeah!!!!')
  end

  def execute
    puts 'Yeah!!!!!'
  end
end

class HogeCommand < Command
  def initialize
    super('hoge~~~~')
  end
  
  def execute
    puts 'hoge~~~~~'
  end
end
