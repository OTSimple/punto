class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :short_tokens, dependent: :destroy
  has_many :moves, dependent: :destroy

  enum state: {
    waiting: 0,
    started: 1,
    finished: 2
  }
end
