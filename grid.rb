require_relative 'block'

class Grid 
  def initialize
    @syms = []
    for i in 1..9 do
      @syms.push(Block.new(i.to_s))
    end
  end
  def set(num, sym)
    @syms[num-1] = Block.new(sym)
    return
  end
  def render()
    print("           \n")
    i = 0
    3.times do
      3.times do
        @syms[i].render()
        if (i+1)%3 != 0
          print("|")
        else
          print("\n")
        end
        i += 1
      end
      if i != 9
        print("———|———|———\n")
      end
    end
    print("           \n")
    return
  end
  def match?(loc)
    row = (loc-1) / 3
    column = (loc+2) % 3
    if @syms[3*row] == @syms[3*row+1] && @syms[3*row] == @syms[3*row+2]
      return true
    end
    if @syms[column] == @syms[column+3] && @syms[column] == @syms[column+6]
      return true
    end
    if @syms[0] == @syms[4] && @syms[0] == @syms[8]
      return true
    end
    if @syms[2] == @syms[4] && @syms[2] == @syms[6]
            return true
    end 
    return false
  end
  def available()
    ans = []
    for i in 0...9
      if @syms[i].sym.to_i == i+1
        ans.push(i+1)
      end
    end
    return ans
  end
end