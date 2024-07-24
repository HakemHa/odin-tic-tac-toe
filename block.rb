class Block

  attr_accessor :sym

  def initialize(sym)
    @sym = sym
  end
  def render
    print(" #{@sym} ")
    return " #{@sym} "
  end
  def ==(block)
    return @sym == block.sym
  end
end