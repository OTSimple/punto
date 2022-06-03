class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :short_tokens, dependent: :destroy
  has_many :moves, dependent: :destroy
end
