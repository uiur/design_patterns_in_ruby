# アダプタは既存のインターフェースと既存のオブジェクトの間の違いを吸収する
# 例は本からとってきた
# この場合だと, clientはEncrypter, adapterはStringIOAdapter, adapteeはString
class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    until reader.eof?
      clear_char = reader.getc
      encrypted_char = clear_char ^ @key[key_index]
      writer.putc(encrypted_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    if @position >= @string.length
      raise EOFError
    end
    ch = @string[@position]
    @position += 1
    ch
  end
  
  def putc(char)
    print char
  end

  def eof?
    @position >= @string.length
  end
end

encrypter = Encrypter.new('XYZZY')
s = StringIOAdapter.new('Forgive me.')
encrypter.encrypt(s,s)
