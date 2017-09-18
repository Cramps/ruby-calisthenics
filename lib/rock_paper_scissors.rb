class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    if !'RPS'.include?(player1[1].to_s) || !'RPS'.include?(player2[1].to_s)
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    case player1[1]
    when 'R'
      if player2[1] == 'P'
        player2
      else
        player1
      end
    when 'P'
      if player2[1] == 'S'
        player2
      else
        player1
      end
    when 'S'
      if player2[1] == 'R'
        player2
      else
        player1
      end
    else
      player1
    end
  end

  def self.tournament_winner(tournament)
    if tournament.size == 2 && (tournament[0][0].is_a? String)
      winner tournament[0], tournament[1]
    else
      winner tournament_winner(tournament[0]), tournament_winner(tournament[1])
    end
  end
end
