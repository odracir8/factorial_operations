require "factorial_operations/version"

module FactorialOperations
  TOTAL_WORKERS = 10.freeze

  def self.calculate(number)
    #Test number
    unless self.is_number?(number)
      return 'O valor passado não é válido'
    end

    if number.to_i < TOTAL_WORKERS
      return self.sequential_factorial(number)
    else
      return self.threading_factorial(number)
    end
  end

  def self.factorial_to_s(number)
    str = number
    (number.to_i - 1).downto(1){ |i|
      str = "#{str}*#{i}"
    }
    return str
  end

  private

  def self.is_number?(n)
    n.to_i.to_s == n.to_s
  end

  def self.threading_factorial(number)
    workers = (0...10).map { |w|
        Thread.new {
          Thread.current['f'] = 1
          _finish = (number.to_f/TOTAL_WORKERS).abs

          # first Thread
          if w == 0
            _start = number
            _finish = _finish.to_i
          # Last Thread
          elsif (w + 1) == TOTAL_WORKERS
            _finish = _finish.round
            _start = (number.to_f - (_finish * w))
          else
            _finish = _finish.to_i
            _start = (number.to_f - (_finish * w))
          end

          _f = (_start.to_i - _finish) + 1

          _start.to_i.downto(_f){ |i|
            Thread.current['f'] = Thread.current['f'] * i
          }
        }
    }

    _total = 1
    workers.each {|t| t.join; _total = _total * t['f'] }
    return _total
  end

  def self.sequential_factorial(number)
    _factorial = 1
    number.to_i.downto(1){ |i|
      _factorial = _factorial * i
    }
    return _factorial
  end

end
