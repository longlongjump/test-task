class Grade < ActiveRecord::Base
  attr_accessible :value
  belongs_to :student
  belongs_to :course

  VALUES = %w(A B C D F)

  validates :value, numericality: {greater_than_or_equal: 0,
                                   less_than: VALUES.length}

  def str_value
    Grade::VALUES[value]
  end
end
