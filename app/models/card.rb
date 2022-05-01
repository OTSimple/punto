class Card < ApplicationRecord
  enum color: {
    red: 0,
    blue: 1,
    green: 2,
    yellow: 3
  }
end
