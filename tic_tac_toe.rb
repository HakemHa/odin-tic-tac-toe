require_relative 'player'
require_relative 'grid'

class TicTacToe
  def initialize()
    @players = []
    print("First player name? ")
    @players.push(Player.new(gets.chomp))
    print("Second player name? ")
    @players.push(Player.new(gets.chomp))
    @grid = Grid.new()
  end
  def main()
    turn = 0
    sym = ['X', 'O']
    loc = 1
    while (!@grid.match?(loc)) && (@grid.available().length() != 0)
      @grid.render()
      print("#{@players[turn].name}'s turn. ")
      loc = (@players[turn].play(@grid.available()))
      @grid.set(loc, sym[turn])
      turn = (turn+1)%2
    end
    @grid.render()
    turn = (turn+1)%2
    if (!@grid.match?(loc))
      print("It's a tie!\n")
    else
      print("#{@players[turn].name}'s won!", "\n")
    end
    return
  end
end

game = TicTacToe.new()
game.main()