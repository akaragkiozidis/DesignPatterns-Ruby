require 'encrypter'

class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    fail EOFError if @position >= @string.length
    ch = @string[@position]
    @position += 1
    ch
  end

  def eof?
    @position >= @string.length
  end
end

# StringIOAdapter allows string to get accepted in encrypter :)
encrypter = Encrypter.new('XYZZY')
reader = StringIOAdapter.new('We attach at dawn')
writer = File.open('out.txt', 'w')
encrypter.encrypt(reader, writer)
