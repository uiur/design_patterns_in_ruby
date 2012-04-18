# Iteratorとは, 「集約オブジェクトが内部表現を公開せずにその要素に順にアクセスする方法を提供する」
# 単純な外部Iterator
class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def has_next?
    @index < @array.size
  end
  
  def item
    @array[@index]
  end

  def next_item
    value = item
    @index += 1
    value
  end
end

ai = ArrayIterator.new([1,2,3])
