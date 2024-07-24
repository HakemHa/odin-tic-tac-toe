class Player

  attr_accessor :name

  def initialize(name)
    @name = name
  end
  def render()
    print(@name)
    return @name
  end
  def play(avail)
    print("Where do you want to place your symbol? ")
    loc = nil
    while !loc
      loc = gets.chomp.to_i
      if not (avail.include? loc)
        print("You must choose from: #{avail.join(', ')}; ")
        loc = nil
      end
    end
    return loc
  end
end