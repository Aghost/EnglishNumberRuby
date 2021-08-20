#!/usr/bin/env ruby

ONESPLACE = ['one',     'two',       'three',    'four',     'five',
             'six',     'seven',     'eight',    'nine']
TEENAGERS = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
             'sixteen', 'seventeen', 'eighteen', 'nineteen']
TENSPLACE = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
             'sixty',   'seventy',   'eighty',   'ninety']

def englishNumber number
  if number <= 0 then return 'positive numbs only' end

  # init
  # --------------------------------------------------
  
  numStr = ""
  left_to_write = number

  # bazillions
  # --------------------------------------------------
  write = left_to_write / 1000000000000
  left_to_write  = left_to_write  - write*1000000000000

  if write > 0
    bazillions = englishNumber write
    numStr = numStr + bazillions + ' bazillion '
  end
  # billions
  # --------------------------------------------------
  write = left_to_write / 1000000000
  left_to_write  = left_to_write  - write*1000000000

  if write > 0
    billions = englishNumber write
    numStr = numStr + billions + ' billion '
  end
  # millions
  # --------------------------------------------------
  write = left_to_write / 1000000
  left_to_write  = left_to_write - write*1000000

  if write > 0
    millions = englishNumber write
    numStr = numStr + millions + ' million '
  end
  # thousands
  # --------------------------------------------------
  write = left_to_write / 1000
  left_to_write  = left_to_write - write*1000

  if write > 0
    thousands = englishNumber write
    numStr = numStr + thousands + ' thousand '
  end
  # hundreds
  # --------------------------------------------------
  write = left_to_write / 100
  left_to_write  = left_to_write - write*100

  if write > 0
    hundreds = englishNumber write
    numStr = numStr + hundreds  + ' hundred '

    if left_to_write > 0
      numStr = numStr + 'and '
    end
  end

  # tens
  # --------------------------------------------------
  write = left_to_write / 10
  left_to_write  = left_to_write - write*10

  if write > 0
    if write == 1 and left_to_write > 0
      numStr = numStr + TEENAGERS[left_to_write-1]
      left_to_write = 0
    else
      numStr = numStr + TENSPLACE[write-1]
    end

    if left_to_write > 0
      numStr = numStr + '-'
    end
  end

  # ones
  # --------------------------------------------------
  write = left_to_write
  left_to_write  = 0

  if write > 0
    numStr = numStr + ONESPLACE[write-1]
  end

  # return
  # --------------------------------------------------
  numStr
end

if ARGV.size > 0
  puts englishNumber(ARGV[0].to_i);
else
  for word in [1, 11, 111, 1111,
              33, 333, 33333, 333333,
              123456789, 12345678987654321] do
    puts "#{word} : #{englishNumber(word)}"
  end
end
