class Encrypter
  def initialize(key)
    @key = key
  end

  def encrypt(reader, writer)
    key_index = 0
    until reader.eof?
      clear_char = reader.getc
      encrypter_char = clear_char ^ @key[key_index]
      writer.putc(encrypter_char)
      key_index = (key_index + 1) % @key.size
    end
  end
end

# Encrypter uses files, not strings
reader = File.open('message.txt')
writer = File.open('message.encrypted', 'w')
encrypter = Encrypter.new('my secret key')
encrypter.encrypt(reader, writer)
