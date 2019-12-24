class Hand < ApplicationRecord
  before_save :calculate_hand

  def calculate_hand
    cards = self.cards
    # result = cards
    cards = cards.split(' ')
    #sort cards by int
    cards = cards.sort_by { |x| x[/\d+/].to_i }
    suits = []
    num = []
    cntIfStraight = 0
    cntIfFlush = 0
    result = ''
    for index in 0 ... cards.size
      card = cards[index]
      suits[index] = card[0]
      num[index] = card.scan(/\d+/).first
      num[index] = num[index].to_i
    end
    test_number = num[0]
    for i in 0 ... 5
      if num[i] == test_number
        cntIfStraight = cntIfStraight + 1
      end
      test_number = test_number + 1
    end

    if cntIfStraight == 5
      result = 'Straight'
    end
  
    suit = suits.uniq()
    if suit.length() == 1
      result << 'Flush'
    end

    if (num[0] == num[1] && num[1] == num[2] && num[2] == num[3]) || 
      (num[1] == num[2] && num[2] == num[3] && num[4] == num[3])
      result = 'Four of a kind'
    end

    if (num[0] == num[1] && num[1] == num[2] && num[3] == num[4]) ||
      (num[0] == num[1] && num[4] == num[2] && num[3] == num[4])
      result = 'Three of a kind'
    end

    if (num[0] == num[1] && num[0] == num[2] && num[3] != num[0] && num[4] != num[0] && num[3] == num[4]) ||
      (num[2] == num[1] && num[3] == num[2] && num[1] != num[0] && num[4] != num[1] && num[0] == num[4]) ||
      (num[2] == num[3] && num[3] == num[4] && num[1] != num[0] && num[1] != num[2] && num[2] == num[0])
      result = 'Three of a kind'
    end
    
    if (num[0] == num[1] && num[2] == num[3]) ||
      (num[0] == num[1] && num[3] == num[4]) ||
      (num[1] == num[2] && num[3] == num[4])
      result = 'Two Pair'
    end
    
    if (num[0] == num[1] && num[0] != num[2] && num[0] != num[3] && num[0] != num[4] && num[2] != num[3] && num[4] != num[2] && num[3] != num[2]) ||
      (num[1] == num[2] && num[1] != num[0] && num[1] != num[3] && num[1] != num[4] && num[4] != num[3] && num[3] != num[0] && num[4] != num[0]) ||
      (num[2] == num[3] && num[2] != num[0] && num[2] != num[4] && num[2] != num[1] && num[4] != num[0] && num[4] != num[1] && num[0] != num[1]) ||
      (num[3] == num[4] && num[3] != num[0] && num[1] != num[3] && num[3] != num[2] && num[1] != num[0] && num[0] != num[2] && num[1] != num[2])
      result = 'One Pair'
    end
    
    if result == ''
      result = 'High Card'
    end
    self.result = result
  end
end
